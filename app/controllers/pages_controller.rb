class PagesController < ApplicationController
  include Statsfunctions
  
  def simplehsmrs
  	@title = "Scottish Hospital HSMRs"
  	
  	@hsmrtable = Simplehsmr.all
  	
  	@expecteds = []
  	@risks = []
  	@chartdata = []
  	@chartdata2 = []

  	
  	@hsmrtable.each {|row| 
  	  @expecteds << row.expected << row.expected << row.expected
  	  @risks << row.risk << row.plcl << row.pucl
  	  @chartdata << [row.expected,row.risk,'blue',row.name]
  	  @chartdata2 << [row.expected,row.plcl,'red']
  	}
  	
  	@expectedsStr = @expecteds.join(',')
  	@risksStr = @risks.join(',')

  	  	

# Ulm K. A simple method to calculate the confidence interval of a standardized mortality ratio. American Journal of Epidemiology 1990;131(2):373-375.
# Dobson AJ, Kuulasmaa K, Eberle E, Scherer J. Confidence intervals for weighted sums of Poisson parameters. Statistics in Medicine 1991;10:457-462.
# http://onlinelibrary.wiley.com/doi/10.1002/sim.4780100317/abstract

  	
  end

end
