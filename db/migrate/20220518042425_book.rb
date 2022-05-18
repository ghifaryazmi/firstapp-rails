class Book < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :name
      t.string :cover_book
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
