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
