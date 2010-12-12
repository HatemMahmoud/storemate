require 'spec_helper'

describe "suppliers/show.html.erb" do
  before(:each) do
    @supplier = assign(:supplier, stub_model(Supplier,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Contact Person/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Phone/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Mobile/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Email/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Website/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Street/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/City/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Postal Code/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Country/)
  end
end
