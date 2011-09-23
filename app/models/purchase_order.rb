class PurchaseOrder < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :supplier
  has_many :purchase_line_items do
    def total_cost
      sum(:total_cost)
    end
  end 

  def pay
    transaction do
      update_stock!
      update_attributes(:paid => true)
    end
  end
  
protected
  
  def update_stock!
    for line_item in purchase_line_items
      line_item.product.update_attribute('units_in_stock', line_item.product.units_in_stock + line_item.quantity)
    end
  end

  def validate_on_create 
    self.errors.clear
    valid_items_count = invalid_items_count = 0
    purchase_line_items.each do |line_item|
      if not line_item.valid?
        invalid_items_count = invalid_items_count + 1
      elsif line_item.product and line_item.quantity and line_item.unit_cost
        valid_items_count = valid_items_count + 1
      end
    end    
    if invalid_items_count > 0
      errors.add_to_base("#{invalid_items_count.to_s} line item(s) are invalid")
    elsif valid_items_count < 1
      errors.add_to_base("No products were selected")
    end
  end
  
end
