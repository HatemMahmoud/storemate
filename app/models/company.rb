class Company < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true, :length => { :within => 3..50 }
end
