# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Courgette.destroy_all
User.destroy_all



addresses_array = [["75011","13 Rue Léon Frot"],
                ["75011", "21 Rue Ternaux"],
                ["75011" , "12 Rue Trousseau"],
                ["75020" , "20 Rue de Ménilmontant"],
                ["75018" , "3 Rue Francoeur"],
                ["75018" , "51 Rue Marcadet"],
                ["75011" , "96 Rue Jean-Pierr-Timbaud"],
                ["75011" , "80 Rue Sedaine"],
                ["75011" , "24 Rue Basfrol"],
                ["75018" , "37 Rue Durantin"] ]


addresses_array.each_with_index  do |set, index|

  new_user = User.new
  random_name = Faker::FunnyName.unique.two_word_name.split()
  new_user.first_name = random_name[0]
  new_user.last_name = random_name[1]
  new_user.password = "123456"
  new_user.username = Faker::Internet.unique.username(specifier:10)
  new_user.address = "#{set[1]} #{set[0]} Paris France"
  new_user.phone_number = "+33" +  Faker::PhoneNumber.subscriber_number(length: 9)
  new_user.email = Faker::Internet.unique.email(name: new_user.first_name)
  file = File.open("app/assets/images/avatar_pics/photo_#{index+1}.jpg")
  new_user.photo.attach(io:file, filename:"photo_#{index+1}", content_type:"image/jpg")


  puts "User #{new_user.id} has been created" if new_user.save
end



list_of_courgettes = ["Atena Polka","Black Beauty", "Crookneck", "Ambassador",
                      "White of Trieste", "Butterstick", "Floridor", "Genovese",
                      "Ortolana di Faenza", "Nimba", "Round from Nice", "Alger Nugget", "Zapallito del Tronco"]
users = User.all


list_of_courgettes.each_with_index do |cour, index|
  new_item =Courgette.new
  new_item.name = cour
  new_item.description = Faker::Hipster.unique.sentence
  new_item.price = rand(15..35)
  new_item.user = users.sample
  file = File.open("app/assets/images/courgettes_images/photo_#{index}.jpg")
  new_item.photo.attach(io:file, filename:"photo_#{index}", content_type:"image/jpg")
  puts "#{cour} has been saved" if new_item.save
end

