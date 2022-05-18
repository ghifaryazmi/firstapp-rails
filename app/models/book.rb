class Book < ApplicationRecord
    belongs_to :user

    validates_presence_of :cover_book
    mount_uploader :cover_book, BookUploader
end