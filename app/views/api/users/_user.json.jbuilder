json.id user.id
json.first_name user.first_name
json.last_name user.last_name
json.email user.email
json.img_url user.img_url
json.date_of_birth user.date_of_birth
json.gender user.gender
json.sexual_orientation user.sexual_orientation
json.age_preference user.age_preference
json.introduction user.introduction
json.dream_job user.dream_job
json.cooking_preference user.cooking_preference
json.book_preference user.book_preference
json.movie_preference user.movie_preference
json.pet_preference user.pet_preference
json.outdoor_activity_preference user.outdoor_activity_preference
json.indoor_activity_preference user.indoor_activity_preference
json.inside_joke user.inside_joke
json.intelligence_level user.intelligence_level
json.what_do_you_do user.what_do_you_do
json.favorite_youtuber user.favorite_youtuber
json.post_first_date user.post_first_date
json.matches_by_id user.user_matches.map(&:match_id)
json.potentials_by_id user.user_potentials.map(&:potential_id)
json.messages_by_id user.sent_messages.map(&:id) + user.received_messages.map(&:id)
json.eligibles_by_id user.user_eligibles.map(&:eligible_id)
# json.age time_ago_in_words(user.date_of_birth).slice(7..8).to_i
