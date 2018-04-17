require 'rails_helper'

RSpec.describe "documents/edit", :type => :view do
  before(:each) do
    @document = assign(:document, Document.create!(
      :description => "MyText"
    ))
  end

  it "renders the edit document form" do
    render

    assert_select "form[action=?][method=?]", document_path(@document), "post" do

      assert_select "textarea#document_description[name=?]", "document[description]"
    end
  end
end
