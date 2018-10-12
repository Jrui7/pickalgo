class LeadPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end


  def inscription_pro?
    true
  end

  def create?
    true
  end

end
