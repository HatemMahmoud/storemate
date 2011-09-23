class PurchaseLineItem < ActiveRecord::Base
  belongs_to :purchase_order
  belongs_to :product
  
  validates_presence_of :product,        :if => :product_required?
  validates_presence_of :unit_cost,      :if => :product_required?
  validates_presence_of :quantity,       :if => :product_required?
  validates_numericality_of :unit_cost,  :greater_than => 0, :if => :product_required?
  validates_numericality_of :quantity,   :greater_than => 0, :if => :product_required?
  
  def before_save
    calculate_total_price
  end
  
protected

  def product_required?
    product || unit_cost || quantity
  end
  
  def calculate_total_price
    self.total_cost = unit_cost * quantity    
  end
end
