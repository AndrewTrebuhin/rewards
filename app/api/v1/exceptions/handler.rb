module V1
  module Exceptions
    module Handler
      extend ActiveSupport::Concern

      included do
        rescue_from :all do |exception|
          case exception
          when ActiveRecord::RecordNotFound
            error!({ message: exception.message, status: 404 }, 404)
          when ActiveRecord::RecordInvalid
            error!({ message: exception.message, status: 406 }, 406)
          else
            error!(message: exception.message)
          end
        end
      end
    end
  end
end
