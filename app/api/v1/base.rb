module V1
  class Base < Grape::API
    version :v1, using: :path

    rescue_from(ActiveRecord::RecordNotFound) { |e| error!(e.message, 404) }

    mount V1::Rewards
  end
end
