json.data @groups do |group|
  json.type "groups"
  json.id group.id
  json.attributes do
    json.name group.name
    json.total group.total
    json.active group.active
    json.unsubscribed group.unsubscribed
    json.bounded group.bounced
    json.junk group.junk
    json.sent group.sent
    json.opened group.opened
    json.clicked group.clicked
    json.created_at group.created_at
    json.updated_at group.updated_at
  end
end
