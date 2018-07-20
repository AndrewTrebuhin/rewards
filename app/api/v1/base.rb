module V1
  class Base < Grape::API
    version :v1, using: :path

    include V1::Exceptions::Handler

    helpers do
      def current_user
        @user = User.find_by(auth_token: params[:auth_token])
        return if @user.blank?
        @current_user ||= @user
      end

      def authenticate!
        error!('Not Authorized', 401) if current_user.blank?
      end
    end

    mount V1::Auth
    mount V1::Rewards
  end
end
