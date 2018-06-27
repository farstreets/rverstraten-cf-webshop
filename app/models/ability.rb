class Ability
  include CanCan::Ability

  def initialize(user)

    # user ||= User.new # guest user (not logged in)
    if user.nil?
      user = User.new
    elsif user.admin?
      can :manage, :all
    else
      can :manage, User, id: user.id
      # cannot :create, Comment # logged in users can also create comments
      # cann :manage, Comment, Comment.where(:user_id => user.id) do |comment|
      #   comment.user_id == user.id
      # end
      # can :manage, Comment.where(user_id: user.id) do |comment|
      #   comment.user_id == user.id
      # end
      # cannot :delete, Comment.where(user_id: user.id)
      # do |product_comment|
      #   comment.user_id == user.id
      # end
      # can :manage, Comment if (comment.user_id == user.id)
      # end
      # can [:new, :create], @comment
      # can [:update, :show, :edit], @comment, user_id: user.id
      # cannot [:destroy, :delete], @comment, user_id: user.id
      # @comment = Comment.find(params[:id])

      # can :manage, Comment, user_id: user.id
      # cannot :destroy, Comment

      can :manage, Comment.where(user_id: user.id) do |comment|
        comment.user_id == user.id
      end
      cannot [:destroy, :delete], Comment.where(user_id: user.id) do |comment|
        comment.user_id == user.id
      end

    end

    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities

  end
end
