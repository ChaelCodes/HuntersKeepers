# frozen_string_literal: true

# This controls access to Gears
class GearPolicy < ApplicationPolicy
  def edit?
    return false unless @user

    @user.admin?
  end

  def delete?
    edit?
  end
end
