# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def currency(amount)
    number_to_currency(amount, :unit => mystore.currency_symbol, :format => "%u %n")
  end
    
  def nice_date(date)
    h date.strftime("%A %d %B %Y")
  end
    
  def nice_datetime(date)
    h date.strftime("%A %d %B %Y - %H:%M %p")
  end
end


# Extend the Enumerable module
module Enumerable
  # Get duplicate elements
  def dups
    inject({}) {|h,v| h[v]=h[v].to_i+1; h}.reject{|k,v| v==1}.keys
  end
end

