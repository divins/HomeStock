class User::ItemsController < User::ApplicationController
  inherit_resources

  actions :index, :new, :create, :edit, :update, :destroy

  private

  def begin_of_association_chain
    current_user
  end
end
