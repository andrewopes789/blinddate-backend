json.user do
  json.partial! '/api/users/user', user: @eligible.user
end
