class Store < ActiveRecord::Base
  belongs_to :company
  has_many :users, :dependent => :destroy
  
  attr_protected :company_id
  
  validates :company_id, :presence => true
  validates :name, :presence => true, :uniqueness => {:scope => :company_id}, :length => { :within => 3..50, :allow_blank => true }
end
