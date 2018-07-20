module V1
  class Rewards < Grape::API
    before { authenticate! }

    resource :rewards do
      desc "Return all user's rewards"
      params do
        optional :status, values: Reward.statuses.keys
      end
      get '/' do
        current_user.rewards.filter_by_status(params[:status])
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
