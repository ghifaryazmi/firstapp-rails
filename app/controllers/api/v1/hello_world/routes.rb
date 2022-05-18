module Api
  module V1
    module HelloWorld
      class Routes < Grape::API
        formatter :json, SuccessFormatter
        error_formatter :json, ErrorFormatter

        # mount resources
        mount Api::V1::HelloWorld::Resources::HelloWorld
      end
    end
  end
end
