require 'spec_helper'

describe "articles/index" do
  before(:each) do
    assign(:articles, [
      stub_model(Article,
        :name => "Name",
        :content => "MyText",
        :tags => "Tags",
        :properties => ""
      ),
      stub_model(Article,
        :name => "Name",
        :content => "MyText",
        :tags => "Tags",
        :properties => ""
      )
    ])
  end

  it "renders a list of articles" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Tags".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
