require 'rack'
require './twilio_to_jonas.rb'

run Rack::TwilioJonas.new  
