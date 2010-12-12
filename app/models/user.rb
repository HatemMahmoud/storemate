class User < ActiveRecord::Base
  belongs_to :store
  
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable
  
  validates :name, :presence => true, :uniqueness => {:scope => :store_id}, :length => { :within => 3..50, :allow_blank => true }
  validates :role, :presence => true
  validates :store, :presence => true, :if => :store_required?
  
  ROLES = %w[admin company_manager store_manager cashier banned]
  
  def admin?
    role == 'admin'
  end
  
  def company
    store.company
  end
  
  def company_id
    store.company_id
  end

  protected
  
  def store_required?
    !admin?
  end
  
  def password_required?
    !persisted? || password.present? || password_confirmation.present?
  end

end