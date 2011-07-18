class Item < ActiveRecord::Base
  belongs_to :user

  def plus_one!
    update_attribute(:actual_stock, (actual_stock+1))
  end
  def minus_one!
    update_attribute(:actual_stock, (actual_stock-1))
  end
end
