require 'spec_helper'

describe "companies/edit.html.erb" do
  before(:each) do
    @company = assign(:company, stub_model(Company,
      :new_record? => false,
      :name => "MyString"
    ))
  end

  it "renders the edit company form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => company_path(@company), :method => "post" do
      assert_select "input#company_name", :name => "company[name]"
    end
  end
end
