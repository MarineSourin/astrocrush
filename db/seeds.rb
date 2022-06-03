require_relative '../app/models/user'
require 'open-uri'
require 'faker'

puts 'Cleaning database...'
User.destroy_all

puts 'Creating team users'

boris = { username: 'Boris',
          email: 'boris_bourdet@hotmail.com',
          password: 'azerty',
          description: 'Si vous fréquentez le thai de la rue Oberkampf, on a dû se croiser',
          hobbies: 'Faire des concerts dans mon salon',
          # birth_date: '26/06/1977',
          # birth_hour: '05:30',
          # birth_location: 'Aix-en-Provence',
          gender: 'male',
          looking_for: 'female' }

etienne = { username: 'Etienne',
            email: 'etiennededi@hotmail.fr',
            password: 'azerty',
            description: "Si toi aussi tu aimes coder en peignoir, on est faits pour s'entendre",
            hobbies: 'Mettre en musique des séries cultes',
            # birth_date: '../../....',
            # birth_hour: '..:..',
            # birth_location: '...',
            gender: 'male',
            looking_for: 'female' }

ghita = { username: 'Ghita',
          email: 'aa.ghita@gmail.com',
          password: 'azerty',
          description: "Attention, je suis très cool mais si tu m'énerves c'est coup de boule direct",
          hobbies: 'Organiser des festivals techno',
          # birth_date: '../../....',
          # birth_hour: '..:..',
          # birth_location: '...',
          gender: 'female',
          looking_for: 'male' }

maria = { username: 'Maria',
          email: 'leonor.varela91330@gmail.com',
          password: 'azerty',
          description: "J'ai inspiré Carlos Santana pour son titre Maria Maria",
          hobbies: 'Fiesta',
          # birth_date: '../../....',
          # birth_hour: '..:..',
          # birth_location: '...',
          gender: female,
          looking_for: male }

users = [boris, etienne, ghita, maria]

photo_boris = File.open(Rails.root.join("public/seed_images/boris.jpg"))
photo_etienne = File.open(Rails.root.join("public/seed_images/etienne.jpg"))
photo_ghita = File.open(Rails.root.join("public/seed_images/ghita.jpg"))
photo_maria = File.open(Rails.root.join("public/seed_images/maria.jpg"))

photos = [photo_boris, photo_etienne, photo_ghita, photo_maria]

users.each_with_index do |user, index|
  profile = User.new(user)
  profile.photos.attach(io: photos[index], filename: user, content_type: 'jpg')
  profile.save!
end

puts 'Team users created succesfully'

puts 'Creating 100 fake users...'

100.times do
  user = User.new(
    username: Faker::Name.first_name,
    email: Faker::Internet.safe_email,
    password: 'azerty',
    description: Faker::Lorem.paragraph_by_chars(number: 100, supplemental: false),
    hobbies: Faker::Hobby.activity, # BOB: to update when hobbies is changed from f.input to f.select
    birth_date: Faker::Date.birthday(min_age: 18, max_age: 65),
    birth_hour: "#{rand(0..23).to_s.rjust(2, '0')}:#{rand(0..59).to_s.rjust(2, '0')}",
    birth_location: Faker::Address.city,
    gender: Faker::Gender.binary_type,
    looking_for: Faker::Gender.binary_type
  )
  file = URI.open('https://thispersondoesnotexist.com/image')
  user.photos.attach(io: file, filename: 'user.png', content_type: 'image/png')
  user.save!
end

puts 'Finished!'

# BOB :
# A garder sous le coude pour éventuellement remplacer les villes proposées par Faker (permet de coupler les villes avec leurs Etats et Pays)
# require 'city-state'
# random_country_key = CS.countries.to_a.sample.first
# random_state_key = CS.states(random_country_key).to_a.sample.first
# birth_location: "#{CS.cities(random_state_key, random_country_key).sample} (#{CS.states(random_country_key)[random_state_key]}, #{CS.countries[random_country_key]})",
