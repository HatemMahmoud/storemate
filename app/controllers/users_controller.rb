class UsersController < ApplicationController
  load_and_authorize_resource :store
  load_and_authorize_resource :user, :through => :store, :shallow => true
  before_filter :find_roles_and_stores, :only => [:new, :edit, :create, :update]
  
  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    if @user.save
      redirect_to users_path, :notice => t('created', :model => 'User')
    else
      render :new
    end
  end

  def update
    if @user.update_attributes(params[:user])
      redirect_to edit_user_path(@user), :notice => t('updated', :model => 'User')
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end
  
  private
  
  def find_roles_and_stores
    @roles = can?(:create, User) ? User::ROLES : ['store_manager', 'cashier']
    @stores = can?(:create, User) ? Store.order('company_id') : current_user.company.stores.order('company_id')
  end
end