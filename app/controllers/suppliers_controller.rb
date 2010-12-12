class SuppliersController < ApplicationController
  load_and_authorize_resource :company
  load_and_authorize_resource :supplier, :through => :company
  
  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    if @supplier.save
      redirect_to company_suppliers_path(@company), :notice => t('created', :model => 'Supplier')
    else
      render :new
    end
  end

  def update
    if @supplier.update_attributes(params[:supplier])
      redirect_to company_suppliers_path(@company), :notice => t('updated', :model => 'Supplier')
    else
      render :edit
    end
  end

  def destroy
    @supplier.destroy
    redirect_to company_suppliers_path(@company)
  end
end