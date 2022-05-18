class Api::V1::Users::Entities::Books < Grape::Entity
    expose :id
    expose :name
    expose :cover_book, merge: true

    private
    def cover_book
        object.try(:cover_book)
    end
end