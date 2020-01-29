# frozen_string_literal: true

# This controls access to Hunters
class HunterPolicy < ApplicationPolicy
  def update?
    @record.user == @user
  end

  def destroy?
    @record.user == @user
  end

  class Scope < Scope
  end
end