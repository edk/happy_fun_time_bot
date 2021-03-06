#!/usr/bin/env ruby
require 'rubygems'
require 'ruby-debug'
require 'yaml'

require File.expand_path('../../lib/happy_fun_time_bot.rb', __FILE__)

# For hipchat, your :jid, :room and :password are available at https://www.hipchat.com/account/xmpp
config = YAML.load_file(File.expand_path('../../config/hipchat.yml', __FILE__))

#Add and remove responder types plugins in the yaml
responder_types = YAML.load_file(File.expand_path('../../config/responder_types.yml', __FILE__))

Bot = HappyFunTimeBot.new(
  :jid              => config["jid"], 
  :nick             => config["nick"], 
  :room             => config["room"], 
  :password         => config["password"],
  :responder_types  => responder_types
)

Bot.run!
