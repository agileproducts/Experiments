class Simplehsmr < ActiveRecord::Base
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

