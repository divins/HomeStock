# This module provides helpers to the controller so it's easier to
# get the current used by it's class.
module Authenticatable
  extend ActiveSupport::Concern

  # Defines current_student, current_business, current_manager and current_tutor
  #
  # It also defines authenticate_student!, authenticate_business!, authenticate_tutor! and authenticate_manager!
  # to redirect the user if it is not the type you want
  module InstanceMethods
    %w{student business manager tutor}.each do |user_type|
      module_eval """
        def current_#{user_type}
          current_user if current_user && current_user.is_a?(#{user_type.camelize})
        end

        def authenticate_#{user_type}!
          redirect_to '/' unless current_#{user_type}
        end
        private :authenticate_#{user_type}!
      """
    end
  end
end

