module V1
  class Base < Grape::API
    version :v1, using: :path

    include V1::Exceptions::Handler

    mount V1::Rewards
  end
end
