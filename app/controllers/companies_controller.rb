class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
  end

  def new
    @company = Company.new
  end

  def edit
    @company = Company.find(params[:id])
  end

  def create
    @company = Company.new(params[:company])
    if @company.save
      redirect_to @company, :notice => t('created', :model => 'Company')
    else
      render :new
    end
  end

  def update
    @company = Company.find(params[:id])

    if @company.update_attributes(params[:company])
      redirect_to @company, :notice => t('updated', :model => 'Company')
    else
      render :edit
    end
  end

  def destroy
    @company = Company.find(params[:id])
    if @company.stores.size > 0
      redirect_to companies_path, :alert => t('companies.cannot_be_deleted')
    else
      @company.destroy
      redirect_to companies_path
    end
  end
end