# frozen_string_literal: true

# prep spec for devise
require 'devise'

module DeviseControllerSpecHelper
  def sign_in(user)
    @request.env['devise.mapping'] = Devise.mappings[:user]
    super user
  end
end

RSpec.configure do |config|
  config.include DeviseControllerSpecHelper, type: :controller

  config.include Devise::Test::IntegrationHelpers, type: :request
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include Devise::Test::IntegrationHelpers, type: :feature
  config.include Warden::Test::Helpers
end
