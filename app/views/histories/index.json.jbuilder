json.array!(@histories) do |history|
  json.extract! history, :id, :user_id, :box_id, :observacion
  json.url history_url(history, format: :json)
end
