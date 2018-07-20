module V1
  class Rewards < Grape::API
    before { authenticate! }

    resource :rewards do
      desc 'Return all rewards'
      get '/' do
        current_user.rewards
      end

      desc 'Return reward by ID'
      params do
        requires :id, type: Integer, desc: 'Reward ID'
      end
      get '/:id' do
        Reward.find(params[:id])
      end
    end
  end
end
