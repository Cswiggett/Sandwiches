class SammichesController < ApplicationController
  def index
  	@sammiches = Sammich.all
end
  def create
    @sammich = Sammich.find_by_name(params[:sammich][:name])
  end
  def random
  	#@sammichy = Sammich.find(:first, :order => "RAND()")
  	@sammichy = Sammich.find(:first, :order => "RANDOM()")
  end
end
