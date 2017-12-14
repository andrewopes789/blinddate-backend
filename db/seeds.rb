# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
# first_namelast_nameemailimg_urlpassworddate_of_birthgendersexual_orientationage_preferenceintroductiondream_jobcooking_preferencebook_preferencemovie_preferencepet_preferencefavorite_youtuberoutdoor_activity_preferenceindoor_activity_preferenceinside_jokeintelligence_levelwhat_do_you_dopost_first_date



User.create(first_name: "Batman", last_name: "Robin", email: "a",
    password: "password", gender: "male", date_of_birth: "1996-03-24",
    sexual_orientation: 'straight')


30.times do

  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email,
    img_url: Faker::Placeholdit.image("50x50"), password: "password",
    date_of_birth: "1980-12-30", gender: ["male", "female"].sample, sexual_orientation: "bisexual",
    age_preference: Faker::Number.number(2), introduction: Faker::Seinfeld.quote, dream_job: Faker::Job.title,
    cooking_preference: Faker::Food.dish, book_preference: Faker::Book.title, movie_preference: Faker::HarryPotter.book,
    pet_preference: Faker::Pokemon.name, favorite_youtuber: Faker::Witcher.character,
    outdoor_activity_preference: Faker::Coffee.blend_name, indoor_activity_preference: Faker::Dessert.topping,
    inside_joke: Faker::Zelda.character, intelligence_level: Faker::Educator.university,
    what_do_you_do: Faker::Job.field, post_first_date: Faker::Movie.quote)
end
