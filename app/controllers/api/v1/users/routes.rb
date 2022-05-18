class Api::V1::Users::Routes < Grape::API
    formatter :json, SuccessFormatter
    error_formatter :json, ErrorFormatter

    mount Api::V1::Users::Resources::Users
end