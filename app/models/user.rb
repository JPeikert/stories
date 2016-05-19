class User < ActiveRecord::Base

  has_many :photos, dependent: :destroy
  has_secure_password

end
