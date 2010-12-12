require 'spec_helper'

describe "products/new.html.erb" do
  before(:each) do
    assign(:product, stub_model(Product,
      :category => nil,
      :code => "MyString",
      :name => "MyString",
      :description => "MyText",
      :unit_price => "9.99",
      :unit_average_cost => "9.99",
      :units_in_stock => 1
    ).as_new_record)
  end

  it "renders new product form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => products_path, :method => "post" do
      assert_select "input#product_category", :name => "product[category]"
      assert_select "input#product_code", :name => "product[code]"
      assert_select "input#product_name", :name => "product[name]"
      assert_select "textarea#product_description", :name => "product[description]"
      assert_select "input#product_unit_price", :name => "product[unit_price]"
      assert_select "input#product_unit_average_cost", :name => "product[unit_average_cost]"
      assert_select "input#product_units_in_stock", :name => "product[units_in_stock]"
    end
  end
end
