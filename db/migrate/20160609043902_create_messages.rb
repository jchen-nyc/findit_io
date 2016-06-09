class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :item_id
      t.integer :recipient_id
      t.integer :user_id
      t.string :message

      t.timestamps

    end
  end
end
