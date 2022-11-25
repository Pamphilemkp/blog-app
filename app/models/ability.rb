class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the user here. For example:
    #
    #     return unless user.present?

    #     can :manage, :Post, author: user
    #     can :manage, :Comment, author: user
    #     can :read, :all

    #     return unless user.role == 'admin'

    #     can :manage, :all
    # end
    if user.role == 'admin'
      can :manage, :all

    else
      can :read, :all
      can :manage, Post, author_id: user.id
      can :manage, Comment, author_id: user.id
    end
  end
end
