require 'spec_helper'

describe "customers/index.html.erb" do
  before(:each) do
    assign(:customers, [
      stub_model(Customer,
        :name => "Name"
      ),
      stub_model(Customer,
        :name => "Name"
      )
    ])
  end

  it "renders a list of customers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
