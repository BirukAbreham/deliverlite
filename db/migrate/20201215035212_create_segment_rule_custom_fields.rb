class CreateSegmentRuleCustomFields < ActiveRecord::Migration[6.0]
  def change
    create_table :segment_rule_custom_fields do |t|
      t.string :value
      t.references :segment_rule, null: false, foreign_key: true
      t.references :custom_field, null: false, foreign_key: true

      t.timestamps
    end
  end
end
