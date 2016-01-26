json.extract! @question, :id, :user_id, :ad_id, :body, :created_at, :updated_at
json.user do
	json.email @question.user.email
	json.name @question.user.name
end
