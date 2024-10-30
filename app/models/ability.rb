class Ability
  include CanCan::Ability

  def initialize(user)
    # Если пользователь не авторизован, у него нет никаких прав
    return unless user

    if user.admin?
      can :manage, :all  # Администратор может делать всё
    else
      can :read, :all  # Все пользователи могут читать темы
      
      # Обычный пользователь может управлять (редактировать и удалять) только своими темами
      can [:update, :destroy], Topic, creator_user_id: user.id
      can [:update, :destroy], Comment, creator_user_id: user.id
      
      # Обычный пользователь может создавать темы
      can :create, Topic
    end
  end
end
