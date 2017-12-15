@rejects.each do |reject|
  json.set! reject.id do
    json.partial! 'reject', reject: reject
  end
end
