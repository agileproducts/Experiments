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
    if expected == 0 or observed == 0
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
    if expected ==0 or observed ==0
      ucl = 0
    else
      rrisk = (((observed.to_f+1) / expected.to_f) * 100).round(1)
      a = 1 - (1/ (9*(observed.to_f+1))) + (1.96/(3*Math.sqrt((observed.to_f+1))));
      b = a**3
      ucl = (rrisk * b).round(1)
    end
    
    return ucl
  end
  
  #functions to calculate 99.8% poisson control limits
  
  def poissonLCL(expected,tolerance)
    
    if expected < 5
      lcl = 0
      return lcl
    else
      lcl = ((expected-expected.truncate) * (poissonLow(expected.ceil,0.001)/expected.ceil - poissonLow(expected.truncate,0.001)/expected.truncate) + poissonLow(expected.truncate,0.001)/expected.truncate) * 100     
      return lcl.round(1)
    end
    
    
    
  end
  
  def poissonUCL(expected, tolerance)
  
      ucl = ((expected-expected.truncate) * (poissonHigh(expected.ceil,0.001)/expected.ceil - poissonHigh(expected.truncate,0.001)/expected.truncate) + poissonHigh(expected.truncate,0.001)/expected.truncate) * 100  
          
    return ucl.round(1)
          
  end
  
  
  def poissonLow(vz,pl)
    if vz <= 0 or pl < 0 or pl > 1 or vz != vz.truncate
      poisLow = 0
    else
      v = 0.5
      dv = 0.5
      
      while dv > 1e-7
        dv = dv/2
        if poissonP((1+vz)*v/(1-v),vz,1e10) > pl
          v = v-dv
        else
          v = v+dv
        end
      end
      
      poisLow = (1+vz) * v/(1-v)    
    end
    
    return poisLow.round(1) 
  end
  
  def poissonHigh(vz,ph)
    if vz <= 0 or ph < 0 or ph > 1 or vz != vz.truncate
      poisHigh = 0
    else
      v = 0.5
      dv = 0.5
      
      while dv > 1e-7
        dv = dv/2
        if poissonP((1+vz)*v/(1-v),0,vz) < ph
          v = v-dv
        else
          v = v+dv
        end
      end
      
      poisHigh = (1+vz) * v/(1-v)    
    end
    
    return poisHigh.round(1) 
  end  
  
  
  def poissonP(z,x1,x2)
    if z < 0
      poisP = 0
    elsif x1 < 0
      poisP = 0
    elsif x2 < 0
      poisP = 0
    elsif x2 < x1
      poisP = 0
    elsif x1 != x1.truncate
      poisP = 0
    elsif x2 != x2.truncate
      poisP = 0
    else
      q = 1
      total = 0
      s = 0
      k = 0
      
      while k <= z or q > (total * 1e-10)
        total = total + q
        if k >= x1 and k <=x2
          s = s + q
        end
        if total > 1e30
          s = s/1e30
          total = total/1e30
          q = q/1e30
        end
        k = k + 1
        q = q * z/k
      end
      
      poisP = s/total
    end
    
    return poisP
        
  end
      
  
  
end #end module