require 'spec_helper'

describe "purchase_orders/index.html.erb" do
  before(:each) do
    assign(:purchase_orders, [
      stub_model(PurchaseOrder,
        :user => nil,
        :supplier => nil,
        :store => nil,
        :total => "9.99",
        :notes => "MyText"
      ),
      stub_model(PurchaseOrder,
        :user => nil,
        :supplier => nil,
        :store => nil,
        :total => "9.99",
        :notes => "MyText"
      )
    ])
  end

  it "renders a list of purchase_orders" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
