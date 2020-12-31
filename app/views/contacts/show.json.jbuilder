json.data do
  json.type "contacts"
  json.id @contact[:contact].id
  json.attributes do
    json.name @contact[:contact].name
    json.email @contact[:contact].email
    json.sent @contact[:contact].sent
    json.open @contact[:contact].open
    json.delivered @contact[:contact].delivered
    json.clicked @contact[:contact].clicked
    json.contact_type @contact[:contact].contact_type
    json.date_subscribed @contact[:contact].date_subscribed
    json.date_unsubscribed @contact[:contact].date_unsubscribed
    json.created_at @contact[:contact].created_at
    json.updated_at @contact[:contact].updated_at
  end
end

json.included do
  if !@contact[:activities].nil?
    json.activities @contact[:activities] do |activity|
      json.type "contact_activities"
      json.id activity.id
      json.attributes do
        json.message activity.message
        json.activity_type activity.activity_type
        json.created_at activity.created_at
        json.updated_at activity.updated_at
      end
    end
  end

  if !@contact[:groups].nil?
    json.groups @contact[:groups] do |group|
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
  end
end