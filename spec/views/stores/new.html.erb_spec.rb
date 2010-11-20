require 'spec_helper'

describe "stores/new.html.erb" do
  before(:each) do
    assign(:store, stub_model(Store,
      :company_id => 1,
      :name => "MyString",
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

  it "renders new store form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => stores_path, :method => "post" do
      assert_select "input#store_company_id", :name => "store[company_id]"
      assert_select "input#store_name", :name => "store[name]"
      assert_select "input#store_phone", :name => "store[phone]"
      assert_select "input#store_mobile", :name => "store[mobile]"
      assert_select "input#store_email", :name => "store[email]"
      assert_select "input#store_website", :name => "store[website]"
      assert_select "input#store_street", :name => "store[street]"
      assert_select "input#store_city", :name => "store[city]"
      assert_select "input#store_postal_code", :name => "store[postal_code]"
      assert_select "input#store_country", :name => "store[country]"
    end
  end
end
