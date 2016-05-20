class User < ActiveRecord::Base

  has_many :photos, dependent: :destroy
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, email: true, uniqueness: { case_sensitive: false}
end
