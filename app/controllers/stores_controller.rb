class StoresController < ApplicationController
  load_and_authorize_resource :company
  load_and_authorize_resource :store, :through => :company
  
  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    if @store.save
      redirect_to company_stores_path(@company), :notice => t('created', :model => 'Store')
    else
      render :new
    end
  end

  def update
    if @store.update_attributes(params[:store])
      redirect_to company_stores_path(@company), :notice => t('updated', :model => 'Store')
    else
      render :edit
    end
  end

  def destroy
    @store.destroy
    redirect_to company_stores_path(@company)
  end
end