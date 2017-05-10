class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)

    can :autocomplete_school_name, School
    can :autocomplete_item_name, Item
    can :manage, User do |u|
        u.id == user.id
    end
    can [:read, :create], School
    can [:read, :update, :list], Order do |o|
        o.user.id === user.id
    end
    can [:read, :browse, :details], Item

    if user.role? :admin
        can :manage, :all
    elsif user.role? :manager
        can :read, :all
        can [:manage], User do |u|
            u.role != "customer"
        end
        can [:create, :edit, :read], Item
        can [:create, :read], ItemPrice
        can [:create], Purchase
        can [:read], [User, Order, School]

    elsif user.role? :shipper
        can [:read, :update, :unshipped], Order
        can :read, Item
    elsif user.role? :customer
        can :create, Order
    else
        can :create, User
    end

    if user.role != nil
        can [:cart, :empty, :add, :update, :remove, :checkout, :place, :cancel], Order
        can :dashboard, User
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
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
