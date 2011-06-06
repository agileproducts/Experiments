class PagesController < ApplicationController
  include Statsfunctions
  
  def hellochart
  	@title = "Hello World of Charts"
  	@rr = relativeRisk(123,115.8)
  	@lcl = byarsLCL(123,115.8)
  	@ucl = byarsUCL(123,115.8)
  	@templ = poissonLCL(178.35,0.001)
  	@temph = poissonUCL(178.35,0.001)
  	
  	@one = 1.45.ceil
  	@two = 1.98.ceil
  	
#  =IF(ISBLANK(L5),"",(((K5-ROUNDDOWN(K5,0))*(poishigh(ROUNDUP(K5,0),0.001)/ROUNDUP(K5,0)-poishigh(ROUNDDOWN(K5,0),0.001)/ROUNDDOWN(K5,0)))+poishigh(ROUNDDOWN(K5,0),0.001)/ROUNDDOWN(K5,0))*100)
# Ulm K. A simple method to calculate the confidence interval of a standardized mortality ratio. American Journal of Epidemiology 1990;131(2):373-375.
# Dobson AJ, Kuulasmaa K, Eberle E, Scherer J. Confidence intervals for weighted sums of Poisson parameters. Statistics in Medicine 1991;10:457-462.
# http://onlinelibrary.wiley.com/doi/10.1002/sim.4780100317/abstract

  	
  end

end
