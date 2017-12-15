json.reject do
  json.partial! '/api/rejects/reject', reject: @reject
end
