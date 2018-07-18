class Reward < ApplicationRecord
  belongs_to :user

  enum status: { waiting_to_be_approved: 0,
                 approved: 1,
                 denied: 2,
                 sent: 3,
                 redeemed: 4,
                 completed: 5 }

  scope :filter_by_status, ->(status) { where(status: status) if status }
end
