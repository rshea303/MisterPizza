class Ability
  include CanCan::Ability

  def initialize(current_user)
    current_user ||= User.new
    can :read, User, id: current_user.id
    can :read, Order, id: current_user.id
  end
end
