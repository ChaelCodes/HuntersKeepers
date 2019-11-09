# frozen_string_literal: true

# Base controller, all other controllers inherit.
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
end
