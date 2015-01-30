class Review < ActiveRecord::Base
  belongs_to :reservation
  belongs_to :user
end
