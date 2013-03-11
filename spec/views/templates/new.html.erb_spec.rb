require 'spec_helper'

describe "templates/new" do
  before(:each) do
    assign(:template, stub_model(Template,
      :name => "MyString",
      :class_name => "MyString",
      :description => "MyText",
      :created_by_id => 1
    ).as_new_record)
  end

  it "renders new template form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", templates_path, "post" do
      assert_select "input#template_name[name=?]", "template[name]"
      assert_select "input#template_class_name[name=?]", "template[class_name]"
      assert_select "textarea#template_description[name=?]", "template[description]"
      assert_select "input#template_created_by_id[name=?]", "template[created_by_id]"
    end
  end
end
