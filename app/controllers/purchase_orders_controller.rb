class PurchaseOrdersController < ApplicationController
  load_and_authorize_resource :store
  load_and_authorize_resource :purchase_order, :through => :store, :shallow => true
  before_filter :find_suppliers, :only => [:new, :edit, :create, :update]
  
  def index
  end

  def show
  end

  def new
  end

  def create
    @purchase_order.user = current_user
    if @purchase_order.save
      redirect_to company_store_purchase_orders_path(@store.company, @store), :notice => t('created', :model => 'Purchase order')
    else
      render :new
    end
  end
  
  private
  
  def find_suppliers
    @suppliers = Supplier.accessible_by(current_ability).order('name')
  end
end