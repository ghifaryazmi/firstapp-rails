class Api::V1::Roles::Entities::Roles < Grape::Entity
    expose :id
    expose :name
    expose :description
    expose :users, as: :users, using: Api::V1::Roles::Entities::Users
end