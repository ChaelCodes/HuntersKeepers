# frozen_string_literal: true

# This controls access to HuntersImprovements
class HuntersImprovementPolicy < ApplicationPolicy
  def initialize(user, record)
    super(user, record)
    @hunter = @record.hunter
  end

  def new?
    return false unless @user && !@user.banned?
    true
  end

  def create?
    return false unless @user && !@user.banned?
    return false unless @hunter.user == @user || @user.admin?
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
end
