class Api::V1::Users::Entities::Roles < Grape::Entity
    expose :id
    expose :name
    expose :description
end