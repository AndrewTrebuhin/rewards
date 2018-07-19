module V1
  class Rewards < Grape::API
    resource :rewards do
      get '/' do
        Reward.all
      end
    end
  end
end
