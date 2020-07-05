# frozen_string_literal: true

# This controls access to Hunters
class HunterPolicy < ApplicationPolicy
  def create?
    return false unless @user && !@user.banned?
    true
  end

  def update?
    return false unless @user
    @record.user == @user || @user.admin?
  end

  def destroy?
    return false unless @user
    @record.user == @user || @user.admin?
  end

  class Scope < Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      return scope.none if @user.nil?
      scope.all
    end
  end
end
