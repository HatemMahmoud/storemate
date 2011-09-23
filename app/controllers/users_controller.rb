class UsersController < ApplicationController
  
  before_filter :admin_only, :only => [:index, :destroy]
  
  def authorized?
    if first_run?
      true
    elsif !admin? && (['edit', 'update'].include? params[:action])
      logged_in? && (current_user.id.to_s == params[:id])  #User can only update their data
    else
      logged_in?
    end 
  end
  
  def index
    @users = User.find(:all, :order => 'login')
  end

  def new
    @user = User.new
  end
  
  def create
    cookies.delete :auth_token
    # protects against session fixation attacks, wreaks havoc with 
    # request forgery protection.
    # uncomment at your own risk
    # reset_session
    @user = User.new(params[:user])
    @user.login = params[:user][:login]
    @user.is_admin = true if first_run?
    @user.save
    if @user.errors.empty?
      if User.count == 1
        self.current_user = @user
        redirect_back_or_default('/')
      else
        redirect_to(users_url)
      end
      flash[:notice] = "User was successfully created."
    else
      render :action => 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    
    if admin?    
      if current_user.id.to_s == params[:id]
        @user.is_admin = true
        @user.enabled = true
      else
        @user.is_admin = params[:user][:is_admin]
        @user.enabled = params[:user][:enabled]
      end
    end
    
    if @user.update_attributes(params[:user])
      flash[:notice] = 'User was successfully updated.'
      if admin?
        redirect_to(users_url)
      else
        redirect_to '/'        
      end
    else
      render :action => 'edit'
    end
  end

  def destroy
    if current_user.id.to_s == params[:id]
      flash[:error] = "You can't delete your account."
      redirect_to(users_url)
    else
      @user = User.find(params[:id])
      @user.destroy
      redirect_to(users_url)
    end
  end

end
