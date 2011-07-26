class Item < ActiveRecord::Base
  belongs_to :user

  before_validation :default_values

  validates :short_description, presence: true
  validates :desired_stock, presence: true, numericality: {greater_than_or_equal_to: 0}
  validates :alarm, presence: true, numericality: {greater_than_or_equal_to: 0}
  validates :actual_stock, presence: true, numericality: {greater_than_or_equal_to: 0}
  validates :category, presence: true
  validate :check_category
  validate :check_alarm

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
      order('actual_stock ASC, alarm DESC')
    end
    def short_description_ordered
      order('short_description ASC')
    end
    def shop
      where('actual_stock <= alarm')
    end
  end

  private

  def default_values
    self.desired_stock ||= 0
    self.alarm ||= 0
    self.actual_stock ||= 0
  end

  def check_category
    errors.add :category, :invalid_category unless Categories.all.include? self.category
  end

  def check_alarm
    errors.add :alarm, :invalid_alarm unless self.desired_stock >= self.alarm
  end
end
