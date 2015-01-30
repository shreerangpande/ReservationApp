class Reservation < ActiveRecord::Base
	belongs_to :user
	has_many :reviews
	accepts_nested_attributes_for :reviews
	validates :pickup_location, presence:true,
								length: {maximum: 19 }
	validates :pickup_time, presence:true
	validates :dropoff_time, presence:true
                    
end
