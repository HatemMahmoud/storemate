class UsersController < ApplicationController
  load_and_authorize_resource :store
  load_and_authorize_resource :user, :through => :store, :shallow => true
  before_filter :find_roles, :only => [:new, :edit, :create, :update]
  
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
      redirect_to store_users_path(@store), :notice => t('created', :model => 'User')
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
    redirect_to store_users_path(@user.store_id)
  end
  
  private
  
  def find_roles
    @roles = current_user.admin? ? User::ROLES : User::ROLES-['admin']
  end
end