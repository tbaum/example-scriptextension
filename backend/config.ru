$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "lib"))

require 'backend.rb'

run Sinatra::Application
