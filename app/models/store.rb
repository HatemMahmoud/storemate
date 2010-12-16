class Store < ActiveRecord::Base
  belongs_to :company, :counter_cache => true
  has_many :purchase_orders, :dependent => :destroy
  has_many :users, :dependent => :destroy
  
  validates :company_id, :presence => true
  validates :name, :presence => true, :uniqueness => {:scope => :company_id}, :length => { :within => 3..50, :allow_blank => true }
end
