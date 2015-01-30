# FactoryGirl.define do
#   factory :user do
#     #email {"shreer#{rand(1000)}@gmail.com"}
#     email "shreerangpande@gmail.com"
#     password 'shreer@1234'
#   end
# end
require 'faker'

FactoryGirl.define do
	factory :user do
		email { Faker::Internet.email }
		password "987654321"
	end
end