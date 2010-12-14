class ProductsController < ApplicationController
  load_and_authorize_resource :category
  load_and_authorize_resource :product, :through => :category, :shallow => true

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
      redirect_to category_products_path(@product.category_id), :notice => t('created', :model => 'Product')
    else
      render :new
    end
  end

  def update
    if @product.update_attributes(params[:product])
      redirect_to category_products_path(@product.category_id), :notice => t('updated', :model => 'Product')
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to category_products_path(@product.category_id)
  end
end