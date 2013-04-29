class SammichesController < ApplicationController
  def index
  	@sammiches = Sammich.all
end
  def create
    @sammich = Sammich.find_by_name(params[:sammich][:name])
  end
end
