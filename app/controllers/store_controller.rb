class StoreController < ApplicationController
  
  before_filter :admin_only

  def edit
    @store = Store.find(:first)
  end

  def update
    @store = Store.find(:first)

    respond_to do |format|
      if @store.update_attributes(params[:store])
        flash[:notice] = 'Store was successfully updated.'
        format.html { redirect_to(home_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @store.errors, :status => :unprocessable_entity }
      end
    end
  end

end
