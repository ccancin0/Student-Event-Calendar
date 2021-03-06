# == Schema Information
#
# Table name: httparty_tests
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rubygems'
require 'httparty'

class HttpartyTest < ApplicationRecord
  include HTTParty

  def create_events
   base_uri = 'https://memgo-api.herokuapp.com/calendar.json'
   response = HttpartyTest.get(base_uri)
   payload = JSON.parse(response.body)
   raw_events = payload.fetch('meetups')
  #  date_format = '%H-%M-%ST%H:%M:%S'

   raw_events.each do |x|
     loaf = DateTime.strptime(x['time'].to_s, "%Q")
    #  puts loaf.strftime(date_format)
    #  puts loaf
    #  puts "Duration: #{x['photo_url']}"
     Event.create(title: x['name'], description: x['description'], color: "black", start: loaf, end: loaf)
   end
 end

end
