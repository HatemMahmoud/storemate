require 'spec_helper'

describe "purchase_orders/new.html.erb" do
  before(:each) do
    assign(:purchase_order, stub_model(PurchaseOrder,
      :user => nil,
      :supplier => nil,
      :store => nil,
      :total => "9.99",
      :notes => "MyText"
    ).as_new_record)
  end

  it "renders new purchase_order form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => purchase_orders_path, :method => "post" do
      assert_select "input#purchase_order_user", :name => "purchase_order[user]"
      assert_select "input#purchase_order_supplier", :name => "purchase_order[supplier]"
      assert_select "input#purchase_order_store", :name => "purchase_order[store]"
      assert_select "input#purchase_order_total", :name => "purchase_order[total]"
      assert_select "textarea#purchase_order_notes", :name => "purchase_order[notes]"
    end
  end
end
