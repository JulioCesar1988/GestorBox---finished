json.array!(@sectors) do |sector|
  json.extract! sector, :id, :nombre, :cod
  json.url sector_url(sector, format: :json)
end
