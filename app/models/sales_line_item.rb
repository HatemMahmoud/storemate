class SalesLineItem < ActiveRecord::Base
  belongs_to :sales_order
  belongs_to :product
  
  validates_presence_of :product,         :if => :product_required?
  validates_presence_of :unit_price,      :if => :product_required?
  validates_presence_of :quantity,        :if => :product_required?
  validates_numericality_of :unit_price,  :greater_than => 0, :if => :product_required?
  validates_numericality_of :quantity,    :greater_than => 0, :if => :product_required?
  
  def before_save
    calculate_total_price
  end
  
protected
  
  def validate
    if product and quantity
      errors.add(:quantity, "can't be greater than stock (#{product.units_in_stock})") if quantity > product.units_in_stock
    end
  end

  def product_required?
    product || unit_price || quantity
  end
  
  def calculate_total_price
    taxes = product.tax_rates.total_taxes
    taxes ||= 0
    self.total_price = quantity * unit_price + quantity * unit_price * taxes / 100
  end

end
