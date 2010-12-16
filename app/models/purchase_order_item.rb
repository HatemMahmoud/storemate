class PurchaseOrderItem < ActiveRecord::Base
  belongs_to :purchase_order
  belongs_to :product
  
  validates :product_id, :presence => true
  validates :cost, :numericality => {:greater_than_or_equal_to => 0}
  validates :quantity, :numericality => {:greater_than => 0}
  validates :total, :numericality => true
  
  before_save :calculate_total
  
  private
  
  def calculate_total
    self.total = cost * quantity
  end
end
