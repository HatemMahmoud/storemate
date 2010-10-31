require 'spec_helper'

describe "companies/show.html.erb" do
  before(:each) do
    @company = assign(:company, stub_model(Company,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
