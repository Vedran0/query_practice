# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

26.times do
  Profession.create(name: Faker::Company.unique.profession)
end
puts "Professions created"
150.times do
  User.create(name: Faker::Name.name, email: Faker::Internet.email, dob: Faker::Date.between(60.years.ago, 15.years.ago), profession_id: rand(25)+1)
end
puts "Users created"
5.times do
  Dessert.create(name: Faker::Dessert.unique.variety)
end
puts "Desserts created"
User.all.each do |user|
  (1..5).to_a.sample(rand(3)).each do |id|
    user.favorite_desserts.create(dessert_id: id)
  end
end
puts "Favorite desserts created"