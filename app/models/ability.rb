class Ability
  include CanCan::Ability

 user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    else
      can :read, :all
    end
  end
end