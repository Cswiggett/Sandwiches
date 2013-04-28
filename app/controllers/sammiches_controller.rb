class SammichesController < ApplicationController
  def index
  	@sammiches = Sammich.all
  end
end
