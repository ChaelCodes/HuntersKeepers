# frozen_string_literal: true

# Default access to all objects in the application.
class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    @user&.admin?
  end

  def new?
    create?
  end

  def update?
    @user&.admin?
  end

  def edit?
    update?
  end

  def destroy?
    @user&.admin?
  end

  # Default access scope for querying records.
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end
  end
end
