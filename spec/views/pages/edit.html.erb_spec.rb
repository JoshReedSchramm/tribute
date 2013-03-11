require 'spec_helper'

describe "pages/edit" do
  before(:each) do
    @page = assign(:page, stub_model(Page,
      :name => "MyString",
      :tagline => "MyString",
      :description => "MyText",
      :main_image => "MyString"
    ))
  end

  it "renders the edit page form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", page_path(@page), "post" do
      assert_select "input#page_name[name=?]", "page[name]"
      assert_select "input#page_tagline[name=?]", "page[tagline]"
      assert_select "textarea#page_description[name=?]", "page[description]"
      assert_select "input#page_main_image[name=?]", "page[main_image]"
    end
  end
end
