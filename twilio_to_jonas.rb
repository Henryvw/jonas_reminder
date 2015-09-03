require 'rubygems'
require 'bundler'
require 'dotenv'
require 'sinatra'
require 'twilio-ruby'
Bundler.require

Dotenv.load

Class TwilioJonas < Sinatra::Base

  account_sid = 'AC05a4b296092d722f091550c84015ab1a'
  auth_token = ENV['AUTH_TOKEN']
  jonas_cell = ENV['RECIPIENT_CELL']
  twilio_phone = ENV['TWILIO_PHONE'] 

  first_message = "Hey Jonas, have you set out a glass of water for tomorrow morning?"
  second_message = "Jonas - water!"

  @twilio_client = Twilio::REST::Client.new(account_sid, auth_token)

  message = @twilio_client.account.messages.create(:body => first_message,
                                                 :to => jonas_cell,
                                                 :from => twilio_phone)
  puts message.to

  get '/' do
    'Hello Twilio!' + Twilio::VERSION + \
  end
end
