# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Courgette.destroy_all
User.destroy_all



10.times do

  new_user = User.new
  random_name = Faker::FunnyName.unique.two_word_name.split()
  new_user.first_name = random_name[0]
  new_user.last_name = random_name[1]
  new_user.password = "123456"
  new_user.username = Faker::Internet.unique.username(specifier:10)
  new_user.address = "22, rue du chemin Vert"
  new_user.city_name = "Paris"
  new_user.city_postcode = "75011"
  new_user.phone_number = "+33" +  Faker::PhoneNumber.subscriber_number(length: 9)
  new_user.email = Faker::Internet.unique.email(name: new_user.first_name)
  puts "User #{new_user.id} has been created" if new_user.save
end



list_of_courgettes = ["Atena Polka","Black Beauty", "Crookneck", "Ambassador",
                      "Blanche de Trieste", "Butterstick", "Floridor", "Genovese Bio",
                      "Ortolana di Faenza", "Nimba", "Ronde de Nice", "Pepite d'Alger", "Zapallito del Tronco"]
users = User.all


list_of_courgettes.each do |cour|
  new_item =Courgette.new
  new_item.name = cour
  new_item.description = Faker::Hipster.unique.sentence
  new_item.price = rand(25..85)
  new_item.user = users.sample

  puts "#{cour} has been saved" if new_item.save
end

