class User::ItemsController < User::ApplicationController

  before_filter :load_categories, only: [:new, :edit]

  inherit_resources

  actions :index, :new, :create, :edit, :update, :destroy

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
