class CategoriesController < ApplicationController
  load_and_authorize_resource :company
  load_and_authorize_resource :category, :through => :company
  
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
      redirect_to company_categories_path(@company), :notice => t('created', :model => 'Category')
    else
      render :new
    end
  end

  def update
    if @category.update_attributes(params[:category])
      redirect_to company_categories_path(@company), :notice => t('updated', :model => 'Category')
    else
      render :edit
    end
  end

  def destroy
    if @category.products.count > 0
      redirect_to company_categories_path(@company), :alert => t('categories.cannot_be_deleted')
    else
      @category.destroy
      redirect_to company_categories_path(@company)
    end
  end
end