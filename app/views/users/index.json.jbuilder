json.array!(@users) do |user|
  json.extract! user, :id, :name, :email, :password_digest, :image, :phone, :type
  json.url user_url(user, format: :json)
end
