class CompaniesController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    if @company.save
      redirect_to companies_path, :notice => t('created', :model => 'Company')
    else
      render :new
    end
  end

  def update
    if @company.update_attributes(params[:company])
      redirect_to companies_path, :notice => t('updated', :model => 'Company')
    else
      render :edit
    end
  end

  def destroy
    if @company.stores.count > 0
      redirect_to companies_path, :alert => t('companies.cannot_be_deleted')
    else
      @company.destroy
      redirect_to companies_path
    end
  end
end