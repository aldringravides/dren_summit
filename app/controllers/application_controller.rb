class ApplicationController < ActionController::Base
  protect_from_forgery
  # acts_as_token_authentication_handler_for User
  # skip_before_filter :verify_authenticity_token
end
