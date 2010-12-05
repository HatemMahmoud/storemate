class Category < ActiveRecord::Base
  belongs_to :company
  
  validates :company_id, :presence => true
  validates :name, :presence => true, :uniqueness => {:scope => :company_id}, :length => { :within => 3..50, :allow_blank => true }
end
