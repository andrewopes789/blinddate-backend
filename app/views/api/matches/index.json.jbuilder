@matches.each do |match|
  json.set! match.id do
    json.partial! 'match', match: match
  end
end
