# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "destroying db"
User.destroy_all
Island.destroy_all

puts "generating db"
number_of_islands = 5
user_array = []

(number_of_islands * 2).times do
  user_model = User.create!(
    name: Faker::FunnyName.two_word_name,
    phone: Faker::PhoneNumber.cell_phone,
    email: Faker::Internet.email,
    password: "123123,"
  )
  user_array.push(user_model.id) if user_array.size < number_of_islands
end

i = 0

number_of_islands.times do
  Island.create!(
    name: Faker::Space.star_cluster,
    description: Faker::Lorem.paragraph,
    price: rand(50_000..1_000_000),
    location: Faker::Address.country,
    rating: rand(0..5),
    user_id: user_array[i]
  )
  i += 1
end

puts "success!"
