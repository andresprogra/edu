json.array!(@questions) do |question|
  json.extract! question, :id, :user_id, :ad_id, :body
  json.url question_url(question, format: :json)
end
