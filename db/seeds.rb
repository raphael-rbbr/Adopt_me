# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Adoption.destroy_all
Pet.destroy_all
User.destroy_all

dono = User.create(email: "dono@lewagon.com", password: "123456", zip_code: "12345-123")
puts "dono created #{dono.id}"

adotante = User.create(email: "adotante@lewagon.com", password: "123456", zip_code: "12345-123")
puts "adotante created #{adotante.id}"

pet = Pet.create(name: "pet", user_id: dono.id)
puts "pet created #{pet.id}"

adoption = Adoption.create(pet_id: pet.id, user_id: adotante.id)
