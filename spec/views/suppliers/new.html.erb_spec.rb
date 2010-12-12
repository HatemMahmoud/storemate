require 'spec_helper'

describe "suppliers/new.html.erb" do
  before(:each) do
    assign(:supplier, stub_model(Supplier,
      :company => nil,
      :name => "MyString",
      :contact_person => "MyString",
      :phone => "MyString",
      :mobile => "MyString",
      :email => "MyString",
      :website => "MyString",
      :street => "MyString",
      :city => "MyString",
      :postal_code => "MyString",
      :country => "MyString"
    ).as_new_record)
  end

  it "renders new supplier form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => suppliers_path, :method => "post" do
      assert_select "input#supplier_company", :name => "supplier[company]"
      assert_select "input#supplier_name", :name => "supplier[name]"
      assert_select "input#supplier_contact_person", :name => "supplier[contact_person]"
      assert_select "input#supplier_phone", :name => "supplier[phone]"
      assert_select "input#supplier_mobile", :name => "supplier[mobile]"
      assert_select "input#supplier_email", :name => "supplier[email]"
      assert_select "input#supplier_website", :name => "supplier[website]"
      assert_select "input#supplier_street", :name => "supplier[street]"
      assert_select "input#supplier_city", :name => "supplier[city]"
      assert_select "input#supplier_postal_code", :name => "supplier[postal_code]"
      assert_select "input#supplier_country", :name => "supplier[country]"
    end
  end
end
