class API < Grape::API
  format :json

  mount V1::Base

  add_swagger_documentation info: { title: 'My Rewards API Documentation' },
                            api_version: :v1,
                            hide_documentation_path: true
end
