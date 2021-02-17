# frozen_string_literal: true

# This controls access to Hunters
class HasHunterPolicy < ApplicationPolicy
  def initialize
    super
    @hunter = @record.hunter
  end

  def create?
    return false unless @user && !@user.banned?
    return false unless @hunter.user == @user
    true
  end

  def update?
    return false unless @user
    @hunter.user == @user || @user.admin?
  end

  def destroy?
    return false unless @user
    @hunter.user == @user || @user.admin?
  end

  # When working with a list of records, this class can limit access
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
