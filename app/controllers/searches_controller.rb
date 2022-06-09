class SearchesController < ApplicationController
  
  def index
    @searches = Search.all
  end

  def new
    @search = Search.new
  end
  
  def create
  end
  
  def show
  end

  def edit
  end
  
  def update
  end
  
  def destroy
  end
end
