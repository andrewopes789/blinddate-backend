json.user do
  json.partial! '/api/users/user', user: @user
end

json.eligibles do
  @user.user_eligibles.each do |eligible|
    json.set! eligible.id do
      json.partial! '/api/eligibles/eligible', eligible: eligible
    end
  end
end

json.potentials do
  @user.user_potentials.each do |potential|
    json.set! potential.id do
      json.partial! '/api/potentials/potential', potential: potential
    end
  end
end

json.matches do
  @user.user_matches.each do |match|
    json.set! match.id do
      json.partial! '/api/matches/match', match: match
    end
  end
end

json.messages do
  (@user.sent_messages + @user.received_messages).each do |message|
    json.set! message.id do
      json.partial! '/api/messages/message', message: message
    end
  end
end
