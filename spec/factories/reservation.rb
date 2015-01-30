require 'faker'
FactoryGirl.define do
  factory :reservation do
  	user_id 19238
    pickup_location Faker::Lorem.characters(18)
    pickup_time Time.now#at(rand * Time.now.to_i)
    dropoff_time Time.now#at(rand * Time.now.to_i)
  end
end