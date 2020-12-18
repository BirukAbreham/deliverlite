class CreateJoinTableContactGroup < ActiveRecord::Migration[6.0]
  def change
    create_join_table :contacts, :groups do |t|
      t.index :contact_id
      t.index :group_id
    end
  end
end
