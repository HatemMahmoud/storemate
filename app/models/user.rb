class User < ActiveRecord::Base
  belongs_to :store, :counter_cache => true
  
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable
  
  validates :name, :presence => true, :uniqueness => {:scope => :store_id}, :length => { :within => 3..50, :allow_blank => true }
  validates :role, :presence => true
  validates :store, :presence => true
  
  ROLES = %w[admin company_manager store_manager cashier banned]
  
  def admin?
    role == 'admin'
  end
  
  def company_id
    store.company_id
  end

  protected
  
  def password_required?
    !persisted? || password.present? || password_confirmation.present?
  end

end