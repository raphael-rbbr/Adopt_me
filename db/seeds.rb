# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require "open-uri"

Adoption.destroy_all
Pet.destroy_all
User.destroy_all

pets = []
users = []
addresses = [
  "Avenida Mem de Sá, 35",
  "Rua Primeiro de Março, 100",
  "Avenida Portugal, 150",
  "Avenida Atlântica, 200",
  "Avenida Vieira Souto, 300",
  "Avenida Rodrigues Alves, 350",
  "Avenida Rio Branco, 55",
  "Avenida Epitácio Pessoa, 10",
  "Rua Visconde de Pirajá, 89",
  "Rua da Glória, 250"
]

user = User.create!(email: "nicholas@gmail.com",
                    password: "123456",
                    first_name: "Nicholas",
                    last_name: "Cage",
                    zip_code: "22071-055",
                    house_number: "496",
                    profile: "I'm #{rand(18..90)} years old, my job is #{Faker::Job.title} and I love #{Faker::Hobby.activity}")
puts "User test created: #{User.last.email}, password 123456"
file = URI.open('https://images.unsplash.com/flagged/photo-1595514191830-3e96a518989b?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687')
user.profile_photo.attach(io: file, filename: 'user.png', content_type: 'image/png')

6.times do |i|
  User.create!(email: Faker::Internet.email,
               password: "123456",
               first_name: Faker::Name.first_name,
               last_name: Faker::Name.last_name,
               zip_code: "#{rand(20_000..28_999)}-#{rand(0..999).to_s.rjust(3, '0')}}",
               house_number: rand(1..1000),
               profile: "I'm #{rand(18..90)} years old, my job is #{Faker::Job.title} and I love #{Faker::Hobby.activity}")
  users << User.last
  puts "user #{User.last.id} created"

  Pet.create!(name: Faker::Creature::Dog.name,
              species: ['dog', 'cat', 'bird'].sample,
              vaccinated: [true, false].sample,
              description: "It's a lovely animal with extremely friendly attitude, loves children and it is often very quiet",
              age: rand(0..14),
              status: ['available', 'adopted'].sample,
              user_id: User.last.id,
              history: "It was found on a plastic bag out on a garbage can on a rainy day. Today we are looking for a new home to this sweet animal",
              gender: ['male', 'female'].sample,
              address: addresses.sample,
              castrated: [true, false].sample)
  file1 = URI.open(Unsplash::Photo.search(Pet.last.species)[i].urls.regular)
  file2 = URI.open(Unsplash::Photo.search(Pet.last.species)[i + 1].urls.regular)
  file3 = URI.open(Unsplash::Photo.search(Pet.last.species)[i + 2].urls.regular)

  Pet.last.photos.attach(io: file1, filename: 'pet.png', content_type: 'image/png')
  Pet.last.photos.attach(io: file2, filename: 'pet.png', content_type: 'image/png')
  Pet.last.photos.attach(io: file3, filename: 'pet.png', content_type: 'image/png')

  pets << Pet.last
  puts "pet #{Pet.last.id} created"
end

3.times do
  Adoption.create(pet_id: pets.sample.id, user_id: users.sample.id)
  puts "adoption #{Adoption.last.id} created"
end
