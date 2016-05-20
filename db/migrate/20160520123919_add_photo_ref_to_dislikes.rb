class AddPhotoRefToDislikes < ActiveRecord::Migration
  def change
    add_reference :dislikes, :photo, index: true, foreign_key: true
  end
end
