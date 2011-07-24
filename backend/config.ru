require 'sinatra'
require 'backend'

begin
puts $NEO4J_SERVER.inspect
rescue e
puts e.inspect
end

run Backend
