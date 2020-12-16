class CreateContactCustomFields < ActiveRecord::Migration[6.0]
  def change
    create_table :contact_custom_fields do |t|
      t.string :value, null: false
      t.references :contact, null: false, foreign_key: true
      t.references :custom_field, null: false, foreign_key: true

      t.timestamps
    end
  end
end
