class AuthorizationContext
  attr_reader :user, :pro
  def initialize(user, pro)
    @user = user
    @pro = pro
  end
end
