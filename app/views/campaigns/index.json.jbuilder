json.meta do
  json.total_pages @total_pages
  json.page @page
  json.per_page @per_page
end

json.data @campaigns do |campaign|
  json.type "campiagns"
  json.id campaign.id
  json.attributes do
    json.status campaign.status
    json.scheduled_at campaign.scheduled_at
    json.sent_at campaign.sent_at
    json.total_recipients campaign.total_recipients
    json.is_archived campaign.is_archived
    json.open_count campaign.open_count
    json.open_rate campaign.open_rate
    json.click_count campaign.click_count
    json.click_rate campaign.click_rate
    json.bounce_count campaign.bounce_count
    json.created_at campaign.created_at
    json.updated_at campaign.updated_at
  end
end
