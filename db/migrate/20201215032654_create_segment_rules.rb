class CreateSegmentRules < ActiveRecord::Migration[6.0]
  def change
    create_table :segment_rules do |t|
      t.string :operator, null: false
      t.text :arguments, null: false
      t.references :segments, null: false, foreign_key: true

      t.timestamps
    end
  end
end
