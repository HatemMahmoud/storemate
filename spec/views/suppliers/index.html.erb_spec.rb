require 'spec_helper'

describe "suppliers/index.html.erb" do
  before(:each) do
    assign(:suppliers, [
      stub_model(Supplier,
        :company => nil,
        :name => "Name",
        :contact_person => "Contact Person",
        :phone => "Phone",
        :mobile => "Mobile",
        :email => "Email",
        :website => "Website",
        :street => "Street",
        :city => "City",
        :postal_code => "Postal Code",
        :country => "Country"
      ),
      stub_model(Supplier,
        :company => nil,
        :name => "Name",
        :contact_person => "Contact Person",
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

  it "renders a list of suppliers" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Contact Person".to_s, :count => 2
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
