json.data do
  json.type "segments"
  json.id @segment.id
  json.attributes do
    json.title @segment.title
    json.created_at @segment.created_at
    json.updated_at @segment.updated_at
  end
end
