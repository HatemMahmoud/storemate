class PurchaseOrdersController < ApplicationController
  # GET /purchase_orders
  # GET /purchase_orders.xml
  def index
    @purchase_orders = PurchaseOrder.find(:all, :order => 'id desc')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @purchase_orders }
    end
  end

  # GET /purchase_orders/1
  # GET /purchase_orders/1.xml
  def show
    @purchase_order = PurchaseOrder.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @purchase_order }
    end
  end

  # GET /purchase_orders/new
  # GET /purchase_orders/new.xml
  def new
    @purchase_order = PurchaseOrder.new
    @purchase_line_items = []
    10.times { @purchase_line_items << PurchaseLineItem.new }

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @purchase_order }
    end
  end

  # POST /purchase_orders
  # POST /purchase_orders.xml
  def create
    @purchase_order = PurchaseOrder.new(params[:purchase_order])
    @purchase_order.user = current_user
    @purchase_line_items = @purchase_order.purchase_line_items.build params[:purchase_line_items].values

    respond_to do |format|
      if @purchase_order.save
        flash[:notice] = 'Purchase order was successfully created.'
        format.html { redirect_to(@purchase_order) }
        format.xml  { render :xml => @purchase_order, :status => :created, :location => @purchase_order }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @purchase_order.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def update
    @purchase_order = PurchaseOrder.find(params[:id])

    respond_to do |format|
      if not @purchase_order.paid and params[:purchase_order][:paid]== "1"
        begin
          @purchase_order.pay
          format.html { redirect_to(@purchase_order) }
          format.xml  { head :ok }
          format.js  { 
            render :update do |page|
              page['purchase_order_submit'].hide
              page['error'].hide
              page['notice'].show
              page['notice'].update('Paid')
              page.visual_effect :highlight, 'notice', :duration => 2
            end
          }  
        rescue Exception => e
          format.js  { 
            render :update do |page|
              page['error'].show
              page['error'].update(e.message)
            end
          } 
        end
      else
          format.html { render :action => "show" }
          format.xml  { render :xml => @purchase_order.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def get_product_cost
    respond_to do |format|
      format.js {
        render :update do |page|
          if params[:product_id]
            product = params[:product_id]
            i = params[:index]
            page['purchase_line_items_' + i + '_unit_cost'].value = Product.find(params[:product_id]).unit_cost
            page << "recalculate_total_cost($('purchase_line_items_' + #{i} + '_unit_cost'));"
          end
        end 
      }
    end    
  end

end








