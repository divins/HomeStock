class ApplicationController < ActionController::Base
  include Authenticatable
  helper_method :current_user
  respond_to :html

  protect_from_forgery
end
