class Api::V1::Roles::Routes < Grape::API
    formatter :json, SuccessFormatter
    error_formatter :json, ErrorFormatter

    mount Api::V1::Roles::Resources::Roles
end