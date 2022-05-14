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


10.times do
  User.create(email: Faker::Internet.email,
              password: "123456",
              first_name: Faker::Name.first_name,
              last_name: Faker::Name.last_name,
              zip_code: "#{rand(20_000..28_999)}-#{rand(0..999).to_s.rjust(3,'0')}}",
              house_number: rand(1..1000),
              profile: "I'm #{rand(18..90)} years old, my job is #{Faker::Job.title} and I love #{Faker::Hobby.activity}")
  users << User.last
  puts "user #{User.last.id} created"
  Pet.create( name: Faker::Creature::Dog.name,
              species: ['dog', 'cat', 'bird'].sample,
              vaccinated: [true, false].sample,
              description: "It's a lovely animal with extremely friendly attitude, loves children and it is often very quiet",
              age: rand(0..14),
              status: ['available', 'adopted'].sample,
              user_id: User.last.id,
              history: "It was found on a plastic bag out on a garbage can on a rainy day. Today we are looking for a new home to this sweet animal",
              gender: ['male', 'female'].sample,
              castrated: [true, false].sample)
  file = URI.open('https://images.unsplash.com/photo-1543466835-00a7907e9de1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8ZG9nfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60')
  Pet.last.photos.attach(io: file, filename: 'pet.png', content_type: 'image/png')
  pets << Pet.last
  puts "pet #{Pet.last.id} created"
end

5.times do
  Adoption.create(pet_id: pets.sample.id, user_id: users.sample.id)
  puts "adoption #{Adoption.last.id} created"
end
