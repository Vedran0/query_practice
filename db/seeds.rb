User.create(email: "vedran.mijatovic@bamboolab.eu", password: "adminadmin", admin: true)
User.create(email: "contact@bamboolab.eu", password: "adminadmin", admin: true)
puts "Users created"
26.times do
  Profession.create(name: Faker::Company.unique.profession)
end
puts "Professions created"
150.times do
  Person.create(name: Faker::Name.name, email: Faker::Internet.email, dob: Faker::Date.between(60.years.ago, 15.years.ago), profession_id: rand(25)+1)
end
puts "People created"
5.times do
  Dessert.create(name: Faker::Dessert.unique.variety)
end
puts "Desserts created"
Person.all.each do |user|
  (1..5).to_a.sample(rand(3)).each do |id|
    user.favorite_desserts.create(dessert_id: id)
  end
end
puts "Favorite desserts created"