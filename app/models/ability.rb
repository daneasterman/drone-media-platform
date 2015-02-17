class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.role? :admin
      can :manage, :all
    elsif user.persisted?
      can :read, :all
      can :map, Flight

      can :create, Flight
      cannot :create, Drone
      cannot :create, Camera

      can :update, Flight do |flight|
        flight.try(:user_id) == user.id
      end

      can :destroy, Flight do |flight|
        flight.try(:user_id) == user.id
      end
    else
      # Describes non-logged-in user ability
      can :read, :all
      can :map, Flight
    end
  end
end