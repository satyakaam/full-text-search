require 'rails_helper'

RSpec.describe DocumentsController, :type => :controller do

  let(:valid_attributes) {
    FactoryGirl.build(:document).attributes.symbolize_keys
  }

  let(:invalid_attributes) {
    {
      "description" => ""
    }
  }

  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all documents as @documents" do
      document = Document.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:documents)).to eq([document])
    end
  end

  describe "GET show" do
    it "assigns the requested document as @document" do
      document = Document.create! valid_attributes
      get :show, {:id => document.to_param}, valid_session
      expect(assigns(:document)).to eq(document)
    end
  end

  describe "GET new" do
    it "assigns a new document as @document" do
      get :new, {}, valid_session
      expect(assigns(:document)).to be_a_new(Document)
    end
  end

  describe "GET edit" do
    it "assigns the requested document as @document" do
      document = Document.create! valid_attributes
      get :edit, {:id => document.to_param}, valid_session
      expect(assigns(:document)).to eq(document)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Document" do
        expect {
          post :create, {:document => valid_attributes}, valid_session
        }.to change(Document, :count).by(1)
      end

      it "assigns a newly created document as @document" do
        post :create, {:document => valid_attributes}, valid_session
        expect(assigns(:document)).to be_a(Document)
        expect(assigns(:document)).to be_persisted
      end

      it "redirects to the created document" do
        post :create, {:document => valid_attributes}, valid_session
        expect(response).to redirect_to(Document.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved document as @document" do
        post :create, {:document => invalid_attributes}, valid_session
        expect(assigns(:document)).to be_a_new(Document)
      end

      it "re-renders the 'new' template" do
        post :create, {:document => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        {
          "description" => "new description"
        }
      }

      it "updates the requested document" do
        document = Document.create! valid_attributes
        put :update, {:id => document.to_param, :document => new_attributes}, valid_session
        document.reload
        expect(assigns(:document)).to eq(document)
      end

      it "assigns the requested document as @document" do
        document = Document.create! valid_attributes
        put :update, {:id => document.to_param, :document => valid_attributes}, valid_session
        expect(assigns(:document)).to eq(document)
      end

      it "redirects to the document" do
        document = Document.create! valid_attributes
        put :update, {:id => document.to_param, :document => valid_attributes}, valid_session
        expect(response).to redirect_to(document)
      end
    end

    describe "with invalid params" do
      it "assigns the document as @document" do
        document = Document.create! valid_attributes
        put :update, {:id => document.to_param, :document => invalid_attributes}, valid_session
        expect(assigns(:document)).to eq(document)
      end

      it "re-renders the 'edit' template" do
        document = Document.create! valid_attributes
        put :update, {:id => document.to_param, :document => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested document" do
      document = Document.create! valid_attributes
      expect {
        delete :destroy, {:id => document.to_param}, valid_session
      }.to change(Document, :count).by(-1)
    end

    it "redirects to the documents list" do
      document = Document.create! valid_attributes
      delete :destroy, {:id => document.to_param}, valid_session
      expect(response).to redirect_to(documents_url)
    end
  end

end
