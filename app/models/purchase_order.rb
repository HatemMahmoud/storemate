class PurchaseOrder < ActiveRecord::Base
  belongs_to :user
  belongs_to :supplier
  belongs_to :store, :counter_cache => true
  
  validates :user_id, :supplier_id, :store_id, :presence => true
end
