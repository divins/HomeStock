class AddAlarmToItems < ActiveRecord::Migration
  def change
      add_column :items, :alarm, :integer
      Item.update_all("alarm = 0")
  end
end
