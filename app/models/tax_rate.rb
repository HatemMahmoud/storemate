class TaxRate < ActiveRecord::Base
  has_and_belongs_to_many :products
  
  validates_presence_of :name
  validates_uniqueness_of :name
  validates_numericality_of :percentage, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 100
end
