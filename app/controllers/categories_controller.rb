class CategoriesController < ApplicationController
  load_and_authorize_resource :company
  load_and_authorize_resource :category, :through => :company, :shallow => true
  
  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    if @category.save
      redirect_to company_categories_path(@category.company_id), :notice => t('created', :model => 'Category')
    else
      render :new
    end
  end

  def update
    if @category.update_attributes(params[:category])
      redirect_to company_categories_path(@category.company_id), :notice => t('updated', :model => 'Category')
    else
      render :edit
    end
  end

  def destroy
    if @category.products.count > 0
      redirect_to company_categories_path(@category.company_id), :alert => t('categories.cannot_be_deleted')
    else
      @category.destroy
      redirect_to company_categories_path(@category.company_id)
    end
  end
end