require 'open-uri'
require 'faker'
require_relative '../app/services/astrology_api'

api_uid = ENV["API_UID"]
api_key = ENV["API_KEY"]

# <--- DATABASE CLEANOUT --->

puts 'Cleaning database...'
User.destroy_all
Match.destroy_all
Chatroom.destroy_all
puts 'Database clean'

# <--- USERS SEEDING --->

puts 'Creating users...'

# <-- Set Team users data --->

boris_data = {
  username: 'Boris',
  email: 'boris_bourdet@hotmail.com',
  password: 'azerty',
  description: 'Si ça vous dit, je connais un très bon thai rue Oberkampf',
  hobbies: 'Faire des concerts dans mon salon',
  birth_date: '26/06/1977',
  birth_hour: '05:30',
  birth_location: 'Aix-en-Provence',
  birth_country: 'FR',
  gender: 1,
  looking_for: 2
}

etienne_data = {
  username: 'Etienne',
  email: 'etiennededi@hotmail.fr',
  password: 'azerty',
  description: "Si toi aussi tu aimes coder en peignoir, on est faits pour s'entendre",
  hobbies: 'Mettre en musique des séries cultes',
  birth_date: '23/06/1994',
  birth_hour: '06:30',
  birth_location: 'Paris',
  birth_country: 'FR',
  gender: 1,
  looking_for: 2
}

ghita_data = {
  username: 'Ghita',
  email: 'aa.ghita@gmail.com',
  password: 'azerty',
  description: "Attention, je suis très cool mais si tu m'énerves c'est coup de boule direct",
  hobbies: 'Organiser des festivals techno',
  birth_date: '23/07/1988',
  birth_hour: '07:30',
  birth_location: 'Casablanca',
  birth_country: 'MA',
  gender: 2,
  looking_for: 1
}

maria_data = {
  username: 'Maria',
  email: 'leonor.varela91330@gmail.com',
  password: 'azerty',
  description: "J'ai inspiré le tube Maria Maria à Carlos Santana",
  hobbies: 'Fiesta',
  birth_date: '15/08/1993',
  birth_hour: '15:15',
  birth_location: 'Cascais',
  birth_country: 'PT',
  gender: 2,
  looking_for: 1
}

team_users_data = [boris_data, etienne_data, ghita_data, maria_data]

# <--- Set famous users data --->

# juliette_armanet_data = {
#   username: 'Juliette',
#   email: 'j.armanet@astrocrush.io',
#   password: 'azerty',
#   description: "D’abord comédienne, puis documentariste, à 30 ans passés, je me suis lancée dans la chanson, avec Michel Berger et Véronique Sanson pour modèles.",
#   hobbies: 'Chanson',
#   birth_date: '04/03/1984',
#   birth_hour: '21:20',
#   birth_location: 'Lille',
#   birth_country: 'FR',
#   gender: 2,
#   looking_for: 1
# }

# melanie_thierry_data = {
#   username: 'Melanie',
#   email: 'm.thierry@astrocrush.io',
#   password: 'azerty',
#   description: "J'adore qu'on me dise que je suis drôle.",
#   hobbies: 'Cinema',
#   birth_date: '17/07/1981',
#   birth_hour: '03:30',
#   birth_location: 'Saint-Germain-en-Laye',
#   birth_country: 'FR',
#   gender: 2,
#   looking_for: 1
# }

# emma_mackey_data = {
#   username: 'Emma',
#   email: 'e.mackey@astrocrush.io',
#   password: 'azerty',
#   description: "Fuck of snowflake.",
#   hobbies: 'Cinema',
#   birth_date: '04/01/1996',
#   birth_hour: '14:42',
#   birth_location: 'Le Mans',
#   birth_country: 'FR',
#   gender: 2,
#   looking_for: 1
# }

# zoe_kravitz_data = {
#   username: 'Zoe',
#   email: 'z.kravitz@astrocrush.io',
#   password: 'azerty',
#   description: "Miaou!",
#   hobbies: 'Cinema',
#   birth_date: '01/12/1988',
#   birth_hour: '02:00',
#   birth_location: 'Los Angeles',
#   birth_country: 'US',
#   gender: 2,
#   looking_for: 1
# }

# natalie_portman_data = {
#   username: 'Natalie',
#   email: 'n.portman@astrocrush.io',
#   password: 'azerty',
#   description: "Que la force soit avec vous...",
#   hobbies: 'Cinema',
#   birth_date: '09/06/1981',
#   birth_hour: '15:42',
#   birth_location: 'Jerusalem',
#   birth_country: 'IL',
#   gender: 2,
#   looking_for: 1
# }

# tom_leeb_data = {
#   username: 'Tom',
#   email: 't.leeb@astrocrush.io',
#   password: 'azerty',
#   description: "La TV me réussit mieux que la chanson.",
#   hobbies: 'TV',
#   birth_date: '21/03/1990',
#   birth_hour: '17:07',
#   birth_location: 'Paris',
#   birth_country: 'FR',
#   gender: 1,
#   looking_for: 2
# }

# pierre_niney_data = {
#   username: 'Pierre',
#   email: 'p.niney@astrocrush.io',
#   password: 'azerty',
#   description: "Le Docteur Juiphe est un cousin éloigné.",
#   hobbies: 'Cinema',
#   birth_date: '13/03/1989',
#   birth_hour: '03:20',
#   birth_location: 'Boulogne-Billancourt',
#   birth_country: 'FR',
#   gender: 1,
#   looking_for: 2
# }

# pio_marmai_data = {
#   username: 'Pio',
#   email: 'p.marmai@astrocrush.io',
#   password: 'azerty',
#   description: "J'ai longtemps alterné abdos et bide qui pend.",
#   hobbies: 'Cinema',
#   birth_date: '13/07/1984',
#   birth_hour: '10:25',
#   birth_location: 'Strasbourg',
#   birth_country: 'FR',
#   gender: 1,
#   looking_for: 2
# }

# robert_pattinson_data = {
#   username: 'Robert',
#   email: 'r.pattinson@astrocrush.io',
#   password: 'azerty',
#   description: "Un bloody mary?",
#   hobbies: 'Cinema',
#   birth_date: '13/05/1986',
#   birth_hour: '05:00',
#   birth_location: 'London',
#   birth_country: 'GB',
#   gender: 1,
#   looking_for: 2
# }

# rege_jean_page_data = {
#   username: 'Rege-Jean',
#   email: 'rj.page@astrocrush.io',
#   password: 'azerty',
#   description: "Mon nom est Bond?",
#   hobbies: 'Cinema',
#   birth_date: '27/04/1988',
#   birth_hour: '12:00',
#   birth_location: 'London',
#   birth_country: 'GB',
#   gender: 1,
#   looking_for: 2
# }

# famous_users_data = [
#   juliette_armanet_data,
#   melanie_thierry_data,
#   emma_mackey_data,
#   zoe_kravitz_data,
#   natalie_portman_data,
#   tom_leeb_data,
#   pierre_niney_data,
#   pio_marmai_data,
#   robert_pattinson_data,
#   rege_jean_page_data
# ]

# <--- Set Fake users data --->

# fake_users_data = []

# 10.times do
#   fake_users_data << {
#     username: Faker::Name.first_name,
#     email: Faker::Internet.safe_email,
#     password: 'azerty',
#     description: Faker::Lorem.paragraph_by_chars(number: 100, supplemental: false),
#     hobbies: Faker::Hobby.activity,
#     birth_date: Faker::Date.birthday(min_age: 18, max_age: 45),
#     birth_hour: "#{rand(0..23).to_s.rjust(2, '0')}:#{rand(0..59).to_s.rjust(2, '0')}",
#     birth_location: 'Paris',
#     birth_country: 'FR',
#     gender: rand(1..2),
#     looking_for: rand(1..2)
#   }
# end

# <--- Set Photos --->

photo_boris = File.open(Rails.root.join("public/seed_images/boris.jpg"))
photo_etienne = File.open(Rails.root.join("public/seed_images/etienne.jpg"))
photo_ghita = File.open(Rails.root.join("public/seed_images/ghita.jpg"))
photo_maria = File.open(Rails.root.join("public/seed_images/maria.jpg"))

team_users_photos = [photo_boris, photo_etienne, photo_ghita, photo_maria]

# photo_juliette_armanet = File.open(Rails.root.join("public/seed_images/juliette_armanet.jpg"))
# photo_melanie_thierry = File.open(Rails.root.join("public/seed_images/melanie_thierry.jpg"))
# photo_emma_mackey = File.open(Rails.root.join("public/seed_images/emma_mackey.jpg"))
# photo_zoe_kravitz = File.open(Rails.root.join("public/seed_images/zoe_kravitz.jpg"))
# photo_natalie_portman = File.open(Rails.root.join("public/seed_images/natalie_portman.jpg"))
# photo_tom_leeb = File.open(Rails.root.join("public/seed_images/tom_leeb.jpg"))
# photo_pierre_niney = File.open(Rails.root.join("public/seed_images/pierre_niney.jpg"))
# photo_pio_marmai = File.open(Rails.root.join("public/seed_images/pio_marmai.jpg"))
# photo_robert_pattinson = File.open(Rails.root.join("public/seed_images/robert_pattinson.jpg"))
# photo_rege_jean_page = File.open(Rails.root.join("public/seed_images/rege_jean_page.jpg"))

famous_users_photos = [
  # photo_juliette_armanet,
  # photo_melanie_thierry,
  # photo_emma_mackey,
  # photo_zoe_kravitz,
  # photo_natalie_portman,
  # photo_tom_leeb,
  # photo_pierre_niney,
  # photo_pio_marmai,
  # photo_robert_pattinson,
  # photo_rege_jean_page
]

# fake_users_photos = []
# 10.times do
#   fake_users_photos << URI.open('https://thispersondoesnotexist.com/image')
# end


photos = team_users_photos #+ famous_users_photos #+ fake_users_photos

# <--- Create Users --->

users_data = team_users_data #+ famous_users_data #+ fake_users_data

users_data.each_with_index do |user_data, index|
  user = User.new(user_data)
  user.sign = AstrologyApi.new(api_uid, api_key).horoscope(user.birth_date, user.birth_hour, user.birth_location, user.birth_country)['planets'].first['sign']
  user.rising = AstrologyApi.new(api_uid, api_key).horoscope(user.birth_date, user.birth_hour, user.birth_location, user.birth_country)['houses'].first['sign']
  user.moon = AstrologyApi.new(api_uid, api_key).horoscope(user.birth_date, user.birth_hour, user.birth_location, user.birth_country)['planets'][1]['sign']
  user.planets = AstrologyApi.new(api_uid, api_key).planets_location(user.birth_date, user.birth_hour, user.birth_location, user.birth_country)
  user.wheel_chart = AstrologyApi.new(api_uid, api_key).wheel_chart(user.birth_date, user.birth_hour, user.birth_location, user.birth_country, "#2E3A59", "#ffffff", "#ffffff", "#2E3A59")
  user.personality_report = AstrologyApi.new(api_uid, api_key).personality_report(user.birth_date, user.birth_hour, user.birth_location, user.birth_country)
  user.photos.attach(io: photos[index], filename: user.username, content_type: 'jpg')
  user.save!
  p "*** #{user.username} ***"
end

# <--- Calculate and attach affinity Scores and love compatibility reports --->

users = User.all

users.each do |user|
  potential_mates = User.where(gender: user.looking_for).where.not(id: user.id)
  score_collection = {}
  love_compatibility_report_collection = {}
  potential_mates.each do |mate|
    mate_score = AstrologyApi.new(api_uid, api_key).match_percentage(
      user.birth_date,
      user.birth_hour,
      user.birth_location,
      user.birth_country,
      mate.birth_date,
      mate.birth_hour,
      mate.birth_location,
      mate.birth_country
    )
    score_collection.store(mate.id, mate_score)

    mate_love_compatibility_report = AstrologyApi.new(api_uid, api_key).love_compatibility_report(
      user.birth_date,
      user.birth_hour,
      user.birth_location,
      user.birth_country,
      mate.birth_date,
      mate.birth_hour,
      mate.birth_location,
      mate.birth_country
    )
    love_compatibility_report_collection.store(mate.id, mate_love_compatibility_report)
  end
  ordered_score_collection = score_collection.sort_by { |id, score| score }
  user.affinity_scores = ordered_score_collection.reverse.to_h
  user.love_compatibility_reports = love_compatibility_report_collection
  puts "*** #{user.username} complementary attachments ok ***"
  user.save!
end

puts "#{User.all.length} users created successfully!"

# <--- MATCHES SEEDING --->

# <--- Select users --->

maria = User.find_by_email('leonor.varela91330@gmail.com')
boris = User.find_by_email('boris_bourdet@hotmail.com')
etienne = User.find_by_email('etiennededi@hotmail.fr')
rege_jean_page = User.find_by_email('rj.page@astrocrush.io')
robert_pattinson = User.find_by_email('r.pattinson@astrocrush.io')
pio_marmai = User.find_by_email('p.marmai@astrocrush.io')
pierre_niney = User.find_by_email('p.niney@astrocrush.io')
tom_leeb = User.find_by_email('t.leeb@astrocrush.io')

# <--- Create Chatrooms --->

puts "Creating Chatrooms..."

7.times { Chatroom.new.save! }

puts "Finished!"

# <--- Create Matches --->

puts "Creating Matches..."

first_match = {
  status: "accepted",
  user_id: maria.id,
  mate_id: boris.id,
  chatroom_id: Chatroom.all[0].id
}

second_match = {
  status: "accepted",
  user_id: maria.id,
  mate_id: etienne.id,
  chatroom_id: Chatroom.all[1].id
}

third_match = {
  status: "accepted",
  user_id: maria.id,
  mate_id: rege_jean_page.id,
  chatroom_id: Chatroom.all[2].id
}

fourth_match = {
  status: "accepted",
  user_id: maria.id,
  mate_id: robert_pattinson.id,
  chatroom_id: Chatroom.all[3].id
}

fifth_match = {
  status: "accepted",
  user_id: maria.id,
  mate_id: pio_marmai.id,
  chatroom_id: Chatroom.all[4].id
}

sixth_match = {
  status: "accepted",
  user_id: maria.id,
  mate_id: pierre_niney.id,
  chatroom_id: Chatroom.all[5].id
}

seventh_match = {
  status: "accepted",
  user_id: maria.id,
  mate_id: tom_leeb.id,
  chatroom_id: Chatroom.all[6].id
}

matches = [first_match, second_match, third_match, fourth_match, fifth_match, sixth_match, seventh_match]

matches.each do |match|
  match_instance = Match.new(match)
  match_instance.save!
end

puts "Finished!"

# # <--- Create Messages --->

# puts "Creating Messages..."

# Message.new(
#   content: "coucou!",
#   chatroom_id: Chatroom.first.id,
#   user_id: maria.id
# ).save!

# Message.new(
#   content: "yo!",
#   chatroom_id: Chatroom.first.id,
#   user_id: boris.id
# ).save!

# Message.new(
#   content: "ça va ?",
#   chatroom_id: Chatroom.first.id,
#   user_id: maria.id
# ).save!

# puts 'Finished!'

# BOB :
# A garder sous le coude pour éventuellement remplacer les villes proposées par Faker (permet de coupler les villes avec leurs Etats et Pays)
# require 'city-state'
# random_country_key = CS.countries.to_a.sample.first
# random_state_key = CS.states(random_country_key).to_a.sample.first
# birth_location: "#{CS.cities(random_state_key, random_country_key).sample} (#{CS.states(random_country_key)[random_state_key]}, #{CS.countries[random_country_key]})",
