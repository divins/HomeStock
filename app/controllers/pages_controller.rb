class PagesController < HighVoltage::PagesController

  before_filter :redirect_to_dashboard, only: 'home'

  include Devise::Controllers::Helpers

  private
    def redirect_to_dashboard
      redirect_to user_root_path if current_user
    end
end
