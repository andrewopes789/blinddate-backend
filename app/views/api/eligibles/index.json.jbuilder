json.eligibleUsers do  
  @eligibles.each do |eligible|
    json.set! eligible.id do
      json.partial! '/api/users/user', user: eligible
    end
  end
end

json.currentUser do
  json.partial! '/api/users/user', user: @user
end
