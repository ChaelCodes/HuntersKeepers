# frozen_string_literal: true

# This controls access to Hunters
class HunterPolicy < ApplicationPolicy
  def create?
    true
  end

  def update?
    @record.user == @user || @user.admin?
  end

  def destroy?
    @record.user == @user || @user.admin?
  end

  class Scope < Scope
  end
end
