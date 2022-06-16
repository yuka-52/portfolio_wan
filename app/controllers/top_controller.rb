class TopController < ApplicationController

  def index
    @searches = Search.all
    @protections = Protection.all
    @sights = Sight.all
  end
end
