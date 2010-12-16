class PurchaseOrder < ActiveRecord::Base
  belongs_to :user
  belongs_to :supplier
  belongs_to :store, :counter_cache => true
  has_many :purchase_order_items
  
  accepts_nested_attributes_for :purchase_order_items, :allow_destroy => :true,
    :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
  
  validates :user_id, :supplier_id, :store_id, :presence => true
  validate :presence_of_items
  
  after_create :calculate_total
  
  private
  
  def presence_of_items
    errors.add(:purchase_order_items, :blank) if purchase_order_items.size == 0
  end
  
  def calculate_total
    update_attributes! :total => purchase_order_items.sum(:total)
  end
end
