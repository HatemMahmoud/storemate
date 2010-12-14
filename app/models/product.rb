class Product < ActiveRecord::Base
  belongs_to :category, :counter_cache => true
  
  validates :category_id, :presence => true
  validates :code, :presence => true, :length => {:within => 3..50, :allow_blank => true}
  validates :name, :presence => true, :uniqueness => {:scope => :category_id}, :length => {:within => 3..100, :allow_blank => true}
  validates :price, :numericality => {:greater_than => 0}
  validates :average_cost, :numericality => {:greater_than_or_equal_to => 0}
  validates :quantity, :numericality => {:greater_than_or_equal_to => 0}
  validate :code_uniqueness_in_company
  
  def code_uniqueness_in_company
    duplicates = Product.includes(:category).where(:code => code, :categories => {:company_id => category.company_id})
    if !new_record?
      duplicates = duplicates.where("products.id <> ?", id)
    end
    errors.add(:code, :taken) if duplicates.count > 0
  end
end