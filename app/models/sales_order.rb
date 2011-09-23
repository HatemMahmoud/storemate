class SalesOrder < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :customer
  has_many :sales_line_items do
    def total_price
      sum(:total_price)
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
    for line_item in sales_line_items
      if line_item.quantity > line_item.product.units_in_stock
        raise "#{line_item.product.name}: Total quantity can't be greater than stock"
      else
        line_item.product.update_attribute('units_in_stock', line_item.product.units_in_stock - line_item.quantity)
      end
    end
  end

  def validate_on_create 
    
    self.errors.clear #clear errors to show errors on individual line items later
    valid_items_count = invalid_items_count = 0
    
    product_ids = products = []
    
    sales_line_items.each do |line_item|
      
      if not line_item.valid?
        invalid_items_count = invalid_items_count + 1
      elsif line_item.product and line_item.quantity and line_item.unit_price
        valid_items_count = valid_items_count + 1
        product_ids << [line_item.product.id]
        products << [line_item.product.id, line_item.quantity]
      end
    end
    
    if invalid_items_count > 0
      errors.add_to_base("#{invalid_items_count} line item(s) are invalid")
    elsif valid_items_count < 1
      errors.add_to_base("No products were selected")
    end
    
    if product_ids.uniq.length < product_ids.length  # duplicate products      
      duplicate_ids = product_ids.dups.collect{|x| x[0]}  # dups() returns an array of arrays    
      duplicate_ids.each do |id|
        total_quantity = 0
        sales_line_items.each do |line_item|
          if line_item.product_id == id
            total_quantity = total_quantity + line_item.quantity
            if total_quantity > line_item.product.units_in_stock
              errors.add_to_base("#{line_item.product.name}: Total quantity can't be greater than stock (#{line_item.product.units_in_stock})")  
            end            
          end
        end
      end
    end
    
  end
  
end