class Dislike < ActiveRecord::Base
  belongs_to :like
  belongs_to :dislike
end
