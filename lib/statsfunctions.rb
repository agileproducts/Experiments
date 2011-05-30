module Statsfunctions
  
  #function to return a relative risk
  def relativeRisk(observed,expected)   
    if expected == 0
      rrisk = 0
    else  
      rrisk = ((observed.to_f / expected.to_f) * 100).round(1)
    end
    
    return rrisk  
  end
  
  #functions to return 95% confidence interval via byar's approximation 
  def byarsLCL(observed,expected)  
    if expected == 0
      lcl = 0
    else
      rrisk = ((observed.to_f / expected.to_f) * 100).round(1)
      a = 1 - (1/ (9*observed.to_f)) - (1.96/(3*Math.sqrt(observed.to_f)));
      b = a**3
      lcl = (rrisk * b).round(1)
    end
    
    return lcl  
  end
  
  def byarsUCL(observed,expected)
    if expected ==0
      ucl = 0
    else
      rrisk = (((observed.to_f+1) / expected.to_f) * 100).round(1)
      a = 1 - (1/ (9*(observed.to_f+1))) + (1.96/(3*Math.sqrt((observed.to_f+1))));
      b = a**3
      ucl = (rrisk * b).round(1)
    end
    
    return ucl
  end
      
  
  
end #end module