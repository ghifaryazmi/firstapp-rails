class Api::V1::Users::Entities::Users < Grape::Entity
    expose :id
    expose :username
    expose :email
    expose :register_at
    expose :created_at
    expose :books, as: :books, using: Api::V1::Users::Entities::Books
    expose :roles, as: :roles, using: Api::V1::Users::Entities::Roles
end