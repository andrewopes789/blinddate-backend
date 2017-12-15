@eligibles.each do |eligible|
  json.set! eligible.id do
    json.partial! 'eligible', eligible: eligible
  end
end
