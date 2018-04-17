class HomeController < ApplicationController
  def index
    if params[:query].present?
      @documents = Document.search(params[:query])
    else
      @documents = Document.all
    end
    respond_to do |format|
      format.js
      format.html
    end
  end
end
