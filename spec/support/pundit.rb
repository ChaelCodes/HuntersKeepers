# frozen_string_literal: true

require 'pundit/rspec'

module PunditViewSpecHelper
  def enable_pundit(view, user)
    without_partial_double_verification do
      allow(view).to receive(:policy) do |record|
        Pundit.policy(user, record)
      end
    end
  end
end

RSpec.configure do |config|
  config.include PunditViewSpecHelper, type: :view
end
