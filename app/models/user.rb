class User < ActiveRecord::Base
  belongs_to :store
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :registerable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me
end
