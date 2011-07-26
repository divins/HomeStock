class AddAlarmToItems < ActiveRecord::Migration
  def change
      add_column :items, :alarm, :integer
  end
end
