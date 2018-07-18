class RewardsController < ApplicationController
  before_action :authenticate_user!

  def index
    @rewards = current_user
               .rewards
               .filter_by_status(params[:status])
               .page(params[:page])
  end
end
