class Api::V1::Main < Grape::API
    include Config

    prefix "api"
    version "v1", using: :path

    mount Api::V1::Users::Routes
    mount Api::V1::HelloWorld::Routes
    #mount Api::V1::Oauth::Routes
    mount Api::V1::Roles::Routes
end