class Item < ActiveRecord::Base
  belongs_to :user

  validates :short_description, presence: true
  validates :desired_stock, presence: true, numericality: {greater_than_or_equal_to: 0}
  validates :actual_stock, presence: true, numericality: {greater_than_or_equal_to: 0}
  validates :category, presence: true
  validate :check_category

  def plus_one!
    self.actual_stock = self.actual_stock+1
    self.save!
  end

  def minus_one!
    self.actual_stock -= 1 if self.actual_stock > 0
    save!
  end

  class << self
    def category_ordered
      order('category DESC')
    end
    def stock_ordered
      # order('(actual_stock/desired_stock) ASC')
      order('actual_stock ASC, desired_stock DESC')
    end
    def short_description_ordered
      order('short_description ASC')
    end
  end

  private

  def check_category
    errors.add :category, :invalid_category unless Categories.all.include? self.category
  end
end
