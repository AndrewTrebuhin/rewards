class RewardsController < ApplicationController
  before_action :authenticate_user!

  def index
    @rewards = current_user
               .rewards
               .page(params[:page])
  end
end
