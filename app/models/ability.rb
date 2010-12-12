class Ability
  include CanCan::Ability

  def initialize(user)
    can [:read, :update], User, :id => user.id
    
    case user.role
      when 'admin'
        can :manage, :all
        cannot [:destroy, :assign_store, :assign_role], User, :id => user.id
      when 'company_manager'
        can [:read, :update], Company, :id => user.company_id
        can :manage, Store, :company_id => user.company_id
        can [:read, :update], User, :store => {:company_id => user.company_id}
        can [:assign_store, :assign_role], User
        cannot :assign_role, User, :id => user.id
        can :manage, Category, :company_id => user.company_id
        can :manage, Product, :category => {:company_id => user.company_id}
      when 'store_manager'
        can :read, Company, :id => user.company_id
        can :read, Store, :id => user.store_id
        can :read, User, :store => {:id => user.store_id}
        can :read, Category, :company_id => user.company_id
        can :read, Product, :category => {:company_id => user.company_id}
      when 'cashier'
        can :read, Company, :id => user.company_id
        can :read, Store, :id => user.store_id
        can :read, Category, :company_id => user.company_id
        can :read, Product, :category => {:company_id => user.company_id}
    end
  end
end