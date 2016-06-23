json.array!(@categories) do |category|
  json.extract! category, :id, :nombre, :cod, :sector_id
  json.url category_url(category, format: :json)
end
