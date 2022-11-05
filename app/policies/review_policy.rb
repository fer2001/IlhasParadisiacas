class ReviewPolicy < ApplicationPolicy
  def new?
    true
  end

  def create?
    record.user == user
  end

  def destroy?
    record.user == user
  end

  # class Scope < Scope
  #  def resolve
  #    scope.all
  #  end
  # end
end
