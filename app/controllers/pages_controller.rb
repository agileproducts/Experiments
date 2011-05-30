class PagesController < ApplicationController
  include Statsfunctions
  
  def hellochart
  	@title = "Hello World of Charts"
  	@rr = relativeRisk(123,115.8)
  	@lcl = byarsLCL(123,115.8)
  	@ucl = byarsUCL(123,115.8)
  	
  end

end
