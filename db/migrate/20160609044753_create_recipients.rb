class CreateRecipients < ActiveRecord::Migration
  def change
    create_table :recipients do |t|
      t.integer :item_id
      t.string :phone_number
      t.string :recipient_name

      t.timestamps

    end
  end
end
