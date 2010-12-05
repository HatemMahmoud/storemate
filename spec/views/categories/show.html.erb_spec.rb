require 'spec_helper'

describe "categories/show.html.erb" do
  before(:each) do
    @category = assign(:category, stub_model(Category,
      :company => nil,
      :name => "Name",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
