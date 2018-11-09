class PickPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def update?
    record.user == user || user.admin == true
  end

  def edit?
    record.user == user || user.admin == true
  end

  def show?
    record.user == user || user.admin == true
  end

  def remove_participation?
    record.user == user || user.admin == true
  end

end
