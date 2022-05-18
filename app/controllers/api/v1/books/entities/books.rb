class Api::V1::Books::Entities::Books < Grape::Entity
    expose :id
    expose :name
    expose :cover_book, merge: true

    def cover_book
        object.try(:cover_book)
    end
end