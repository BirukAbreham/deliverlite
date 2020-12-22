json.data @contacts do |contact|
  json.type "contacts"
  json.id contact.id
  json.attributes do
    json.name contact.name
    json.email contact.email
    json.sent contact.sent
    json.open contact.open
    json.delivered contact.delivered
    json.clicked contact.clicked
    json.contact_type contact.contact_type
    json.date_subscribed contact.date_subscribed
    json.date_unsubscribed contact.date_unsubscribed
    json.created_at contact.created_at
    json.updated_at contact.updated_at
  end
end
