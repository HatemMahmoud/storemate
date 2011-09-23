class Product < ActiveRecord::Base
  belongs_to :unit_type
  belongs_to :category, :counter_cache => true
  has_and_belongs_to_many :tax_rates do
    def total_taxes
      sum(:percentage)
    end
  end
  
  validates_presence_of :name
  validates_presence_of :category_id
  validates_presence_of :unit_type_id
  
  validates_uniqueness_of :name
  validates_uniqueness_of :code, :if => Proc.new { |p| !p.code.blank? }
  
  validates_numericality_of :unit_cost,       :greater_than_or_equal_to => 0
  validates_numericality_of :unit_price,      :greater_than_or_equal_to => 0
  validates_numericality_of :units_minimum,   :greater_than_or_equal_to => 0
  validates_numericality_of :units_in_stock,  :greater_than_or_equal_to => 0
  validates_numericality_of :units_on_order,  :greater_than_or_equal_to => 0
end
