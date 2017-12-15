json.user do
  json.partial! '/api/users/user', user: @potential.user
end
