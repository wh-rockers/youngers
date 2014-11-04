json.array!(@users) do |user|
  json.extract! user, :id, :skill, :desc, :corp, :position, :name
  json.url user_url(user, format: :json)
end
