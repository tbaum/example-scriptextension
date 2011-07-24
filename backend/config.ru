require 'sinatra'
# require 'backend'

begin
puts $NEO4J_SERVER.inspect
rescue e
puts e.inspect
end


class Backend < Sinatra::Base


  configure do
    puts "configure2"
    begin
    puts $NEO4J_SERVER.inspect
    rescue e
    puts e.inspect
    end


    unless $NEO4J_SERVER
      # please ensure a clean database for this example!
      Neo4j::Config[:storage_path] = '~/Downloads/neo4j-community-1.4/data/graph.db'
    end


    unless Person.find("name: I").first
      Neo4j::Transaction.run do

        me = Person.new :name => "I"
        you = Person.new :name => "You"
        me.in_love << you
      end
    end

    puts "configure3"
  end

  before do
    puts "before"
  end

  get "/connections/:name" do |name|
    puts "doget"
    #   puts $NEO4J_SERVER }x"

    me = Person.find("name: #{name}").first
    return unless me

    Hash[me.in_love.collect { |r| [:love, r.name + " zz"] }].to_json
  end

end



run Backend
