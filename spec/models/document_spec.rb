require 'rails_helper'

RSpec.describe Document, :type => :model do
  
  it "is valid with valid attributes" do
    expect(Document.new).to_not be_valid
    expect(Document.new(description: "Everything")).to be_valid
  end

  it "is not valid without a description" do
    document = Document.create(description: nil)
    expect(document).to_not be_valid
  end

  it "creates a keyword set after save" do
    document = FactoryGirl.create(:document)
    expect(document.keywords.count).to_not be_zero
  end
end
