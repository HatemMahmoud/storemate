class User < ActiveRecord::Base
  belongs_to :store
  
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  
  validates :name, :presence => true, :uniqueness => {:scope => :store_id}, :length => { :within => 3..50, :allow_blank => true }
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :registerable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable
end
