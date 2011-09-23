class TaxRatesController < ApplicationController
  
  before_filter :admin_only
  
  # GET /tax_rates
  # GET /tax_rates.xml
  def index
    @tax_rates = TaxRate.find(:all, :order => 'name')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tax_rates }
    end
  end

  # GET /tax_rates/new
  # GET /tax_rates/new.xml
  def new
    @tax_rate = TaxRate.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tax_rate }
    end
  end

  # GET /tax_rates/1/edit
  def edit
    @tax_rate = TaxRate.find(params[:id])
  end

  # POST /tax_rates
  # POST /tax_rates.xml
  def create
    @tax_rate = TaxRate.new(params[:tax_rate])

    respond_to do |format|
      if @tax_rate.save
        flash[:notice] = 'TaxRate was successfully created.'
        format.html { redirect_to(tax_rates_url) }
        format.xml  { render :xml => @tax_rate, :status => :created, :location => @tax_rate }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tax_rate.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tax_rates/1
  # PUT /tax_rates/1.xml
  def update
    @tax_rate = TaxRate.find(params[:id])

    respond_to do |format|
      if @tax_rate.update_attributes(params[:tax_rate])
        flash[:notice] = 'TaxRate was successfully updated.'
        format.html { redirect_to(tax_rates_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tax_rate.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tax_rates/1
  # DELETE /tax_rates/1.xml
  def destroy
    @tax_rate = TaxRate.find(params[:id])
    @tax_rate.destroy

    respond_to do |format|
      format.html { redirect_to(tax_rates_url) }
      format.xml  { head :ok }
    end
  end
end
