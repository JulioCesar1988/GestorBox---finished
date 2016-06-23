json.array!(@users) do |user|
  json.extract! user, :id, :sector_id, :role, :nombre, :apellido
  json.url user_url(user, format: :json)
end
