# frozen_string_literal: true

# Base controller, all other controllers inherit.
# Pundit controller for application policy
class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  before_action :authenticate_user!
end

