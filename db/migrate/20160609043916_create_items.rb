class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :user_id
      t.string :image
      t.string :location
      t.string :item_name

      t.timestamps

    end
  end
end
