
require 'spec_helper'
require 'faker'
describe Reservation do
it 'should be a valid reservation' do
		p = Reservation.create(pickup_location: "mumbai", pickup_time: Time.at(rand * Time.now.to_i), dropoff_time: Time.at(rand * Time.now.to_i))
		expect(p).to be_valid
end
it "is invalid without pickup_location" do
		FactoryGirl.build(:reservation, pickup_location: nil).should_not be_valid
	end
it "is invalid without pickup_time" do
		FactoryGirl.build(:reservation, pickup_time: nil).should_not be_valid
end
it "is invalid without dropoff_time" do
		FactoryGirl.build(:reservation, dropoff_time: nil).should_not be_valid
end
it 'should show error for invalid reservation, having no pickup_location' do
		p = Reservation.create(pickup_location: nil , pickup_time: Time.at(rand * Time.now.to_i), dropoff_time: Time.at(rand * Time.now.to_i))
		expect(p).to have(1).errors_on(:pickup_location)
end
it 'should show error for invalid reservation, having no pickup_time' do
		p = Reservation.create(pickup_location: "mumbai" , pickup_time: nil, dropoff_time: Time.at(rand * Time.now.to_i))
		expect(p).to have(1).errors_on(:pickup_time)
end
it 'should show error for invalid reservation, having no dropoff_time' do
		p = Reservation.create(pickup_location: "mumbai" , pickup_time: Time.at(rand * Time.now.to_i), dropoff_time: nil)
		expect(p).to have(1).errors_on(:dropoff_time)
end
it "is invalid if pickup_location is longer than 20 characters" do
		FactoryGirl.build(:reservation, pickup_location: Faker::Lorem.characters(21)).should_not be_valid
	end
end