json.meta do
  json.total_pages @total_pages
  json.page @page
  json.per_page @per_page
end

json.data @segment_rules do |rule|
  json.type "segment_rules"
  json.id rule.id
  json.attributes do
    json.operator rule.operator
    json.arguments rule.arguments
    json.created_at rule.created_at
    json.updated_at rule.updated_at
  end
end
