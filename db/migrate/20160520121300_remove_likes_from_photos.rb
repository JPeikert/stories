class RemoveLikesFromPhotos < ActiveRecord::Migration
  def change
    remove_column :photos, :likes, :integer
    remove_column :photos, :dislikes, :integer
  end
end
