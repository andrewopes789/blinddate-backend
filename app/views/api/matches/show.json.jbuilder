json.currentUser do
  json.partial! '/api/users/user', user: @match.user
end

json.match do
  json.partial! '/api/matches/match', match: @match
end
