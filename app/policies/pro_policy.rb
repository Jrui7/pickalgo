class ProPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def show?
    record == @user || @user.admin == true
  end

  def update?
    record == @user || @user.admin == true
  end


  def update_password?
    @user || @user.admin == true
  end

  def my_campaigns?
    record == @user
  end
end
