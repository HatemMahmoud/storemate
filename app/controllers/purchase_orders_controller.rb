class PurchaseOrdersController < ApplicationController
  load_and_authorize_resource :store
  load_and_authorize_resource :purchase_order, :through => :store, :shallow => true
  before_filter :find_suppliers, :only => [:new, :edit, :create, :update]
  
  def index
  end

  def show
  end

  def new
    3.times {@purchase_order.purchase_order_items.build}
  end

  def create
    @purchase_order.user = current_user
    if @purchase_order.save
      redirect_to @purchase_order, :notice => t('created', :model => 'Purchase order')
    else
      render :new
    end
  end
  
  private
  
  def find_suppliers
    @suppliers = Supplier.where(:company_id => @store.company_id).order('name')
  end
end