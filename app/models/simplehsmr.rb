class Simplehsmr < ActiveRecord::Base
  include Statsfunctions
  
  def risk
    relativeRisk(observed,expected)
  end
  
  def blcl
    byarsLCL(observed,expected)
  end
  
  def bucl
    byarsUCL(observed,expected)
  end
  
  def plcl
    poissonLCL(expected,0.001)
  end
  
  def pucl
    poissonUCL(expected,0.001)
  end  
  
end

# == Schema Information
#
# Table name: simplehsmrs
#
#  id         :integer         not null, primary key
#  code       :string(255)
#  name       :string(255)
#  year       :integer
#  half       :integer
#  patients   :float
#  observed   :float
#  expected   :float
#  created_at :datetime
#  updated_at :datetime
#

