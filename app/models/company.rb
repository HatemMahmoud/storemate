class Company < ActiveRecord::Base
  has_many :stores, :dependent => :destroy
  validates :name, :presence => true, :uniqueness => true, :length => { :within => 3..50, :allow_blank => true }
end
