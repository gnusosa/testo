require 'spec_helper'

describe "articles/new" do
  before(:each) do
    assign(:article, stub_model(Article,
      :name => "MyString",
      :content => "MyText",
      :tags => "MyString",
      :properties => ""
    ).as_new_record)
  end

  it "renders new article form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", articles_path, "post" do
      assert_select "input#article_name[name=?]", "article[name]"
      assert_select "textarea#article_content[name=?]", "article[content]"
      assert_select "input#article_tags[name=?]", "article[tags]"
      assert_select "input#article_properties[name=?]", "article[properties]"
    end
  end
end
