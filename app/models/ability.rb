class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new

    if user.is_admin?
      can :manage, :all
    else
      can [:create, :new, :show], Review
      can [:edit, :update, :destroy], Review, Review do |review|
        review.user_id == user.id
      end
      can [:create, :new, :show], Comment
      can [:edit, :update, :destroy], Comment, Comment do |comment|
        comment.user_id == user.id
      end
      can :show, Book
    end
  end
end
