class ProPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def show?
    record == Pro.find(record.id) || @user.admin == true
  end

  def update?
    record == Pro.find(record.id) || @user.admin == true
  end
end
