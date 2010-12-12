class Product < ActiveRecord::Base
  belongs_to :category, :counter_cache => true
  
  validates :category_id, :presence => true
  validates :code, :presence => true, :length => {:within => 3..50, :allow_blank => true}
  validates :name, :presence => true, :uniqueness => {:scope => :category_id}, :length => {:within => 3..100, :allow_blank => true}
  validates :price, :numericality => {:greater_than => 0}
  validates :average_cost, :numericality => {:greater_than_or_equal_to => 0}
  validates :quantity, :numericality => {:greater_than_or_equal_to => 0}
  validate :code_uniqueness_in_company
  
  def company_id
    category.company_id
  end
  
  def code_uniqueness_in_company
    unique = true
    duplicates_count = Product.includes(:category).where(:code => self.code, :categories => {:company_id => self.company_id}).count
    if self.new_record?
      unique = false if duplicates_count > 0
    else
      unique = false if duplicates_count > 1
    end
    errors.add(:code, :taken) if !unique
  end
end