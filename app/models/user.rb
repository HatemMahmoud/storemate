class User < ActiveRecord::Base
  belongs_to :store
  
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable
  
  validates :name, :presence => true, :uniqueness => {:scope => :store_id}, :length => { :within => 3..50, :allow_blank => true }
  validates :role, :presence => true
  
  ROLES = %w[admin manager cashier banned]
end