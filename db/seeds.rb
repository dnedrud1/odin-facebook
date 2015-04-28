# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Users
User.create!(name:  "Daniel Nedrud",
             email: "dnedrud1@example.com",
             password:              "Password",
             password_confirmation: "Password",)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@example.com"
  password = "Password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,)
end

# Microposts
users = User.order(:created_at).take(6)
10.times do
  content = Faker::Lorem.sentence(3)
  users.each { |user| user.posts.create!(content: content) }
end