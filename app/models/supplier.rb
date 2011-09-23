class Supplier < ActiveRecord::Base  
  validates_presence_of :name  
  validates_uniqueness_of :name
  validates_format_of :email, :with => /(^([^@\s]+)@((?:[-_a-z0-9]+\.)+[a-z]{2,})$)|(^$)/i, :if => Proc.new { |s| !s.email.blank? }
  validates_format_of :website, :with => /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$/ix, :if => Proc.new { |s| !s.website.blank? }
end
