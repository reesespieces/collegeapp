#Institution Information
# puts col[1] #institution name
# puts col[2] #address
# puts col[3] #city
# puts col[4] #State
# puts col[5] #zip code
# puts col[6] #phone
# puts col[9] #website

#Campus Information
# puts col[11] #campus name
# puts col[12] #address
# puts col[13] #city
# puts col[14] #state
# puts col[15] #zip code

# TO DO: Copy db init code here

require 'rubygems'
require 'bundler'
Bundler.require
# Sequel.extension :migration
DB = Sequel.connect(ENV['DATABASE_URL'] || 'sqlite://db/main.db')
require "./models/college.rb"

require 'csv'
institutions = {}
CSV.foreach("./seed/college_data.csv") do |line|
  institutions[line[1]] = {:address => line[2].to_s, :city => line[3].to_s, :state => line[4].to_s, :zipcode => line[5].to_s, :phone => line[6].to_s, :website => line[9].to_s}
end
# puts institutions["4-States Okmulgees Academy of Cosmetology"]

# TO DO: Create a record for each institution in the hash institutions |key, value|

DB.transaction do
  institutions.each do |college_name, record|
    c = College.new
    c.name = college_name
    c.address = record[:address]
    c.city = record[:city]
    c.state = record[:state]
    c.zipcode = record[:zipcode]
    c.phone = record[:phone]
    c.website = record[:website]
    c.save
  end
end



#Ruby Documentation for Hash
#http://ruby-doc.org/core-1.9.3/Hash.html

#RUBY Documentation for reading CSV files:
#http://ruby-doc.org/stdlib-1.9.2/libdoc/csv/rdoc/CSV.html#class-CSV-label-All+at+Once






















#require 'csv'


#CSV.foreach("./college_data.csv") do |col|
#  institutions = {}
#  institutions[col[1] = [col[2],col[3],col[4],col[5],col[6],col[7]]]

#  puts institutions
# use row here...

# puts col.inspect


# @row = []
# File.read(col[1]).each_line do |line|
#   @row << line.chop
# end
# puts @row

# col.each do
#
#   # @institution = Hash.new(col[1]=>[col[2],col[3],col[4],col[5],col[6],col[7]])
#
# end
#
# puts @institution[""].inspect

# @array = col.inspect
# puts @array[0]

# @hash = {col[1] => [col[2], col[3], col[4], col[5]]}
# puts @hash

# col.inspect
# col.readlines

# end

#row.search(keyword)