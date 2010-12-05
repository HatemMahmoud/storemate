require 'spec_helper'

describe "categories/edit.html.erb" do
  before(:each) do
    @category = assign(:category, stub_model(Category,
      :new_record? => false,
      :company => nil,
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit category form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => category_path(@category), :method => "post" do
      assert_select "input#category_company", :name => "category[company]"
      assert_select "input#category_name", :name => "category[name]"
      assert_select "textarea#category_description", :name => "category[description]"
    end
  end
end
