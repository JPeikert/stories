class RemoveLikesFromComments < ActiveRecord::Migration
  def change
    remove_column :comments, :likes, :integer
    remove_column :comments, :dislikes, :integer
  end
end
