class TopsController < ApplicationController
  def index
    @searches_count = Search.count
    @protections_count = Protection.count
    @sights_count = Sight.count
  end
end
