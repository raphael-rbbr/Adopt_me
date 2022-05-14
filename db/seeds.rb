# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Adoption.destroy_all
Pet.destroy_all
User.destroy_all

10.times do
  User.create(email: Faker::Internet.email,
              password: "123456",
              first_name: Faker::Name.first_name,
              last_name: Faker::Name.last_name,
              zip_code: "#{rand(20_000..28_999)}-#{rand(0..999).to_s.rjust(3,'0')}}",
              house_number: rand(1..1000),
              profile: "I'm #{rand(18..90)} years old, my job is #{Faker::Job.title} and I love #{Faker::Hobby.activity}")
  puts "dono created #{User.last.id}"
  Pet.create(name: Faker::Creature::Dog.name, user_id: User.last.id)
  puts "pet created #{Pet.last.id}"
end

# adotante = User.create(email: "adotante@lewagon.com", password: "123456", zip_code: "12345-123")
# puts "adotante created #{adotante.id}"

# adoption = Adoption.create(pet_id: pet.id, user_id: adotante.id)
