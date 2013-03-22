class Ability
  include CanCan::Ability

  def initialize(user)
    #can :read, :all 

    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    if user 
      if user.role == "admin"
        can :read, :all
        can :read, Statusupdate, :deleted_at => !nil
        can :manage, Statusupdate
        can :manage, Comment
      else
     #   can :read
        can :manage, Statusupdate, :username => user.username, :deleted_at => nil
        can :create, Statusupdate
        can :update, Statusupdate do |statusupdate|
            statusupdate.try(:username) == user
        end
        can :manage, Comment, :commenter => user.username, :deleted_at => nil
        can :create, Comment
        can :update, Comment do |comment|
            comment.try(:commenter) == user
        end
      end
    end
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
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
