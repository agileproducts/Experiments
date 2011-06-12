# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
#
# http://czitszit.blogspot.com/2010/02/fastercsv-dbseed-in-rails.html

FasterCSV.foreach("#{RAILS_ROOT}/ScotSimpleHsmrData.csv") do |row|
Simplehsmr.create(
:code => row[0],
:name => row[1],
:year => row[2],
:half => row[3],
:patients => row[4],
:observed =>row[5],
:expected =>row[6]
)

end
