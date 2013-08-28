require 'spec_helper'

describe "articles/edit" do
  before(:each) do
    @article = assign(:article, stub_model(Article,
      :name => "MyString",
      :content => "MyText",
      :tags => "MyString",
      :properties => ""
    ))
  end

  it "renders the edit article form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", article_path(@article), "post" do
      assert_select "input#article_name[name=?]", "article[name]"
      assert_select "textarea#article_content[name=?]", "article[content]"
      assert_select "input#article_tags[name=?]", "article[tags]"
      assert_select "input#article_properties[name=?]", "article[properties]"
    end
  end
end
