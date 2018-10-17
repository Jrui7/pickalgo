class LeadPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end


  def more_infos?
    true
  end

  def create?
    true
  end

end
