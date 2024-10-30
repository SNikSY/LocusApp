class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user

    if user.admin?
      can :manage, :all
    else
      can :read, :all
      
      can [:update, :destroy], Topic, creator_user_id: user.id
      can [:update, :destroy], Comment, creator_user_id: user.id
      
      can :create, Topic
    end
  end
end
