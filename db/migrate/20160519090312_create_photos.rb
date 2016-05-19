class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :title
      t.text :description
      t.text :img
      t.integer :likes, array: true
      t.integer :dislikes, array: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
