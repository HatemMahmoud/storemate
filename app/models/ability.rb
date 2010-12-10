class Ability
  include CanCan::Ability

  def initialize(user)
    can [:read, :update], User, :id => user.id
    
    case user.role
      when 'admin'
        can :manage, :all
      when 'company_manager'
        can [:read, :update], Company, :id => user.company_id
        can :manage, Store, :company_id => user.company_id
        can [:read, :update], User, :store => {:company_id => user.company_id}
        can :assign_store, User
        can :assign_role, User, do |u|
          u.id != user.id
        end
        can :manage, Category, :company_id => user.company_id
      when 'store_manager'
        can :read, Company, :id => user.company_id
        can :read, Store, :id => user.store_id
        can :read, User, :store => {:id => user.store_id}
        can :read, Category, :company_id => user.company_id
      when 'cashier'
        can :read, Company, :id => user.company_id
        can :read, Store, :id => user.store_id
        can :read, Category, :company_id => user.company_id
    end
  end
end