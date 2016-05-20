class Like < ActiveRecord::Base
  belongs_to :photo
  belongs_to :comment
end
