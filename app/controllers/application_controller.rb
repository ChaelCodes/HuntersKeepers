# frozen_string_literal: true

# Base controller, all other controllers inherit.
# Pundit controller for application policy
class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  after_action :verify_authorized, except: :index
  default_form_builder ApplicationFormBuilder

  def check_for_mobile
    session[:mobile_override] = params[:mobile] if params[:mobile]
  end

  def mobile_device?
    if session[:mobile_override]
      session[:mobile_override] == '1'
    else
      # Season this regexp to taste. I prefer to treat iPad as non-mobile.
      (request.user_agent =~ /(Mobile|webOS)/)
    end
  end

  helper_method :mobile_device?

  private

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'
    redirect_to(request.referrer || root_path)
  end
end
