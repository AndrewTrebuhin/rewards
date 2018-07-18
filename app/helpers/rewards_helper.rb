module RewardsHelper
  def statuses_select_collection
    Reward.statuses.transform_keys(&:humanize)
  end
end
