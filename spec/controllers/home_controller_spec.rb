require 'rails_helper'

RSpec.describe HomeController, :type => :controller do

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "displays all records if query string is nil" do
      get :index
      expect(assigns(:documents)).to eq(Document.all)
    end

    it "search if query string is present" do
      get :index, query: "abc"
      expect(assigns(:documents)).to eq(Document.search("abc"))
    end
  end
end
