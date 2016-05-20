class Photo < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes
  has_many :dislikes

  validates :title, presence: true
  validates :img, presence: true
end
