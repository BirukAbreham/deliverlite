json.meta do
  json.total_pages @total_pages
  json.page @page
  json.per_page @per_page  
end

json.data @segments do |segment|
  json.type "segments"
  json.id segment.id
  json.attributes do
    json.title segment.title
    json.created_at segment.created_at
    json.updated_at segment.updated_at
  end
end
