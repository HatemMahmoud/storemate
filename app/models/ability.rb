class Ability
  include CanCan::Ability

  def initialize(user)
    can :update, User, :id => user.id
    case user.role
      when 'admin'
        can :manage, :all
        can :assign_roles, User
      when 'manager'
        can :manage, Store, :company_id => user.company_id
        #can :manage, Product, :store => {:company_id => user.company_id}
      when 'cashier'
    end
  end
end