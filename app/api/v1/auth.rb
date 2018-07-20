module V1
  class Auth < Grape::API
    resources :auth do
      desc 'User registration'
      params do
        requires :email,    type: String, allow_blank: false, desc: 'Email'
        requires :password, type: String, allow_blank: false, desc: 'Password'
        optional :name,     type: String, allow_blank: false, desc: 'Name'
      end
      post '/sign_up' do
        User.create!(email: params[:email], password: params[:password], name: params[:name])
      end

      desc 'User log in'
      params do
        requires :email,    type: String, allow_blank: false, desc: 'Email'
        requires :password, type: String, allow_blank: false, desc: 'Password'
      end
      post '/sign_in' do
        user = User.find_by(email: params[:email].downcase)
        error!('Bad Authentication Parameters', 401) unless user.present? &&
                                                            user.valid_password?(params['password'])
        user.regenerate_auth_token
        user
      end

      desc 'User log out'
      params do
        requires :auth_token, type: String, allow_blank: false, desc: 'Auth token'
      end
      delete '/sign_out' do
        authenticate!
        current_user.regenerate_auth_token
      end

      desc "Change user's settings"
      params do
        optional :name,  type: String, allow_blank: false, desc: 'Name'
        optional :email, type: String, allow_blank: false, desc: 'Email'
        requires :current_password, type: String, allow_blank: false, desc: 'Current password'
      end
      put do
        authenticate!
        error!('Bad Authentication Parameters', 401) unless current_user.valid_password?(params[:current_password])
        current_user.update_with_password(name: params[:name],
                                          email: params[:email],
                                          current_password: params[:current_password])
        current_user
      end
    end
  end
end
