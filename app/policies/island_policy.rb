class IslandPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
    def resolve
      scope.where.not(user: user)
    end

    def show?
      true
    end

    def create?
      true
    end 
  end
end
