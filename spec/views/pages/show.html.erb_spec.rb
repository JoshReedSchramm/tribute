require 'spec_helper'

describe "pages/show" do
  before(:each) do
    @page = assign(:page, stub_model(Page,
      :name => "Name",
      :tagline => "Tagline",
      :description => "MyText",
      :main_image => "Main Image"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Tagline/)
    rendered.should match(/MyText/)
    rendered.should match(/Main Image/)
  end
end
