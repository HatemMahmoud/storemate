class SalesOrdersController < ApplicationController
  # GET /sales_orders
  # GET /sales_orders.xml
  def index
    @sales_orders = SalesOrder.find(:all, :order => 'id desc')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sales_orders }
    end
  end

  # GET /sales_orders/1
  # GET /sales_orders/1.xml
  def show
    @sales_order = SalesOrder.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @sales_order }
    end
  end

  # GET /sales_orders/new
  # GET /sales_orders/new.xml
  def new
    @sales_order = SalesOrder.new
    @sales_line_items = []
    10.times { @sales_line_items << SalesLineItem.new }

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @sales_order }
    end
  end

  # POST /sales_orders
  # POST /sales_orders.xml
  def create
    @sales_order = SalesOrder.new(params[:sales_order])
    @sales_order.user = current_user
    @sales_line_items = @sales_order.sales_line_items.build params[:sales_line_items].values

    respond_to do |format|
      if @sales_order.save
        flash[:notice] = 'Sales order was successfully created.'
        format.html { redirect_to(@sales_order) }
        format.xml  { render :xml => @sales_order, :status => :created, :location => @sales_order }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @sales_order.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def update
    @sales_order = SalesOrder.find(params[:id])

    respond_to do |format|
      if not @sales_order.paid and params[:sales_order][:paid]== "1"
        begin
          @sales_order.pay   # raises an exception if stock is not enough
          format.html { redirect_to(@sales_order) }
          format.xml  { head :ok }
          format.js  { 
            render :update do |page|
              page['sales_order_submit'].hide
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
        format.xml  { render :xml => @sales_order.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def get_product_price
    respond_to do |format|
      format.js {
        render :update do |page|
          if params[:product_id] != "" # if not the first element of the combo box 'None'
            product = params[:product_id]
            i = params[:index]
            page['sales_line_items_' + i + '_unit_price'].value = Product.find(params[:product_id]).unit_price
            page['sales_line_items_' + i + '_total_taxes'].value = Product.find(params[:product_id]).tax_rates.total_taxes
            page << "recalculate_total_price($('sales_line_items_' + #{i} + '_unit_price'));"
          end
        end 
      }
    end    
  end
  
end
