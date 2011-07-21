class User::ItemsController < User::ApplicationController

  before_filter :load_categories, only: [:new, :edit]

  inherit_resources

  actions :index, :new, :create, :edit, :update, :destroy

  def index
    @items = Item.category_ordered.stock_ordered
  end

  def plus_one
    resource.plus_one!
    redirect_to :back
  end

  def minus_one
    resource.minus_one!
    redirect_to :back
  end

  private

  def begin_of_association_chain
    current_user
  end

  def load_categories
    @categories = []
    Categories.all.each do |category|
      @categories << [t("categories.#{category}"), category]
    end
  end
end
