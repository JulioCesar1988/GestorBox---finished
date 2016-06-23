json.array!(@boxes) do |box|
  json.extract! box, :id, :descripcion, :sector_id, :category_id, :codigo, :ubicacion, :precinto_A, :precinto_B, :fecha
  json.url box_url(box, format: :json)
end
