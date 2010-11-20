require 'spec_helper'

describe "stores/index.html.erb" do
  before(:each) do
    assign(:stores, [
      stub_model(Store,
        :company_id => 1,
        :name => "Name",
        :phone => "Phone",
        :mobile => "Mobile",
        :email => "Email",
        :website => "Website",
        :street => "Street",
        :city => "City",
        :postal_code => "Postal Code",
        :country => "Country"
      ),
      stub_model(Store,
        :company_id => 1,
        :name => "Name",
        :phone => "Phone",
        :mobile => "Mobile",
        :email => "Email",
        :website => "Website",
        :street => "Street",
        :city => "City",
        :postal_code => "Postal Code",
        :country => "Country"
      )
    ])
  end

  it "renders a list of stores" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Mobile".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Website".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Street".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "City".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Postal Code".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Country".to_s, :count => 2
  end
end
