require 'spec_helper'

describe User do
it 'should be a valid user' do
	#p = FactoryGirl.build(:user)
	p=FactoryGirl.create(:reservation)
	expect(p).to be_valid
end
it "should not be valid email address" do
	place=/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	FactoryGirl.build(:user, email: "place@gmail.com").should be_valid
end
  it "is invalid with a duplicate email address" do
    FactoryGirl.create(:user, email: "hello@example.com")
    p = FactoryGirl.build(:user, email: "hello@example.com")
    p.valid?
    expect(p.errors[:email]).to include("has already been taken")
  end
end
