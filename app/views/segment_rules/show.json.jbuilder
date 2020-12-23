json.data do
  json.type "segment_rules"
  json.id @segment_rule.id
  json.attributes do
    json.operator @segment_rule.operator
    json.arguments @segment_rule.arguments
    json.created_at @segment_rule.created_at
    json.updated_at @segment_rule.updated_at
  end
end
