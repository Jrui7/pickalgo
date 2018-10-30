class CampaignPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.ongoing
    end
  end

end
