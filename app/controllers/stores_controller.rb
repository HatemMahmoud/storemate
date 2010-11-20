class StoresController < ApplicationController
  before_filter :find_company
  before_filter :find_companies, :only => [:new, :edit, :create, :update]
  before_filter :find_store, :only => [:show, :edit, :update, :destroy]
  
  def index
    @stores = @company.stores
  end

  def show
  end

  def new
    @store = @company.stores.new
  end

  def edit
  end

  def create
    @store = @company.stores.new(params[:store])
    if @store.save
      redirect_to company_store_path(@company, @store), :notice => t('created', :model => 'Store')
    else
      render :new
    end
  end

  def update
    if @store.update_attributes(params[:store])
      redirect_to company_store_path(@company, @store), :notice => t('updated', :model => 'Store')
    else
      render :edit
    end
  end

  def destroy
    @store.destroy
    redirect_to company_stores_path(@company)
  end
  
  private
  
  def find_company
    @company = Company.find(params[:company_id])
  end
  
  def find_companies
    @companies = Company.all
  end
  
  def find_store
    @store = @company.stores.find(params[:id])
  end
end
