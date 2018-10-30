class CampaignPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.ongoing
    end
  end
  def new?
    true
  end

  def create?
    true
  end

  def show?
    true
  end

  def promo?
    true
  end

end
