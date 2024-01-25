class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Post

    return unless user.present?

    can :create, Post
    can :create, Comment

    can [:destroy], Post, author_id: user.id
    can [:destroy], Comment, user_id: user.id

    return unless user.role == 'admin'

    can :manage, :all
  end
end
