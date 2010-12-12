class ProductsController < ApplicationController
  load_and_authorize_resource :category
  load_and_authorize_resource :product, :through => :category#, :shallow => true
  before_filter :find_categories, :only => [:new, :edit, :create, :update]

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    if @product.save
      redirect_to company_category_products_path(@category.company, @category), :notice => t('created', :model => 'Product')
    else
      render :new
    end
  end

  def update
    if @product.update_attributes(params[:product])
      redirect_to company_category_products_path(@category.company, @category), :notice => t('updated', :model => 'Product')
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to company_category_products_path(@category.company, @category)
  end
  
  private
  
  def find_categories
    @categories = current_user.admin? ? Category.order('company_id ASC, name ASC') : current_user.company.categories.order('company_id ASC, name')
  end
end