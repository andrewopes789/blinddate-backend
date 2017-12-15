json.user do
  json.partial! '/api/users/user', user: @reject.user
end
