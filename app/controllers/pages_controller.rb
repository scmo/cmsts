class PagesController < ApplicationController
  def index
    @stations = Station.all

    puts @stations.inspect
  end
end
