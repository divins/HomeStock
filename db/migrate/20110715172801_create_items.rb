class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :user_id
      t.string :category
      t.string :short_description
      t.integer :desired_stock
      t.integer :actual_stock

      t.timestamps
    end
  end
end
