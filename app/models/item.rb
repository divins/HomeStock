class Item < ActiveRecord::Base
  belongs_to :user

  validates :short_description, presence: true
  validates :desired_stock, presence: true, numericality: {greater_than_or_equal_to: 0}
  validates :actual_stock, presence: true, numericality: {greater_than_or_equal_to: 0}
  validates :category, presence: true
  validate :check_category

  def plus_one!
    update_attribute(:actual_stock, (actual_stock+1))
  end
  def minus_one!
    update_attribute(:actual_stock, (actual_stock-1))
  end

  private

  def check_category
    errors.add :category, :invalid_category unless Categories.all.include? self.category
  end
end
