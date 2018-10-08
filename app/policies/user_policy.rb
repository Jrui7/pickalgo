class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def show?
    record == user || user.admin == true
  end

  def update?
    record == user || user.admin == true
  end
end
