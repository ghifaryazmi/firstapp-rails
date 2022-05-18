class Api::V1::Roles::Entities::Users < Grape::Entity
    expose :id
    expose :username
    expose :email
end