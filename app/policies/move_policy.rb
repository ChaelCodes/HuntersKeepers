# frozen_string_literal: true

# This controls access to Moves
class MovePolicy < ApplicationPolicy
  def roll?
    return false unless @user && !@user.banned?
    true
  end
end
