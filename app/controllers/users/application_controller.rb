# The main Rails controller within the User namespace.
#
class User::ApplicationController < ApplicationController
  before_filter :authenticate_user!
end

