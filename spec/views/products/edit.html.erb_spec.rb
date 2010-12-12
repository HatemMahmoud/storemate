require 'spec_helper'

describe "products/edit.html.erb" do
  before(:each) do
    @product = assign(:product, stub_model(Product,
      :new_record? => false,
      :category => nil,
      :code => "MyString",
      :name => "MyString",
      :description => "MyText",
      :unit_price => "9.99",
      :unit_average_cost => "9.99",
      :units_in_stock => 1
    ))
  end

  it "renders the edit product form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => product_path(@product), :method => "post" do
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
