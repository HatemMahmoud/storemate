class Supplier < ActiveRecord::Base
  belongs_to :company, :counter_cache => true
  
  attr_protected :company_id
  
  validates :company_id, :presence => true
  validates :name, :presence => true, :uniqueness => {:scope => :company_id}, :length => { :within => 3..50, :allow_blank => true }
end
