json.partial! 'user', user: @user

json.potentials do
  @user.potentials.each do |potential|
    json.set! potential.id do
      json.partial! '/api/potentials/potential', potential: potential
    end
  end
end

json.matches do
  @user.matches.each do |match|
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
