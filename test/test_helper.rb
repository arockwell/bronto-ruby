require 'test/unit'
require 'turn'
require 'shoulda'

require 'bronto'
Bronto::Base.api_key = ""

#Savon.configure { |config| config.log = false }

HTTPI.log = false

def log_savon(&block)
  #Savon.configure { |config| config.log = true }
  block.call()
  #Savon.configure { |config| config.log = false }
end

def reset_all
  types = [Bronto::Contact, Bronto::Field, Bronto::List, Bronto::Message]

  types.each do |type|
    objs = type.find
    type.destroy(objs) if objs.count > 0
  end
end
