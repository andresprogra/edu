json.array!(@grupos) do |grupo|
  json.extract! grupo, :id, :nombre
  json.url grupo_url(grupo, format: :json)
end
