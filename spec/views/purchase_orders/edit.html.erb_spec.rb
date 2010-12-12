require 'spec_helper'

describe "purchase_orders/edit.html.erb" do
  before(:each) do
    @purchase_order = assign(:purchase_order, stub_model(PurchaseOrder,
      :new_record? => false,
      :user => nil,
      :supplier => nil,
      :store => nil,
      :total => "9.99",
      :notes => "MyText"
    ))
  end

  it "renders the edit purchase_order form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => purchase_order_path(@purchase_order), :method => "post" do
      assert_select "input#purchase_order_user", :name => "purchase_order[user]"
      assert_select "input#purchase_order_supplier", :name => "purchase_order[supplier]"
      assert_select "input#purchase_order_store", :name => "purchase_order[store]"
      assert_select "input#purchase_order_total", :name => "purchase_order[total]"
      assert_select "textarea#purchase_order_notes", :name => "purchase_order[notes]"
    end
  end
end
