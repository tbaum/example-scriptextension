require "sinatra"
require "neo4j"

class Person
  include Neo4j::NodeMixin
  property :name
  has_n :in_love
  index :name
end

def create_graph()
  Neo4j::Transaction.run do
    return if Person.find("name: I").first

    me = Person.new :name => "I" 
    you = Person.new :name => "You"
    me.in_love << you
  end
end


configure do
  puts "init sini"
  puts "x#{ $NEO4J_SERVER }x"
    unless $NEO4J_SERVER
  # please ensure a clean database for this example!
    Neo4j::Config[:storage_path] = '~/Downloads/neo4j-community-1.4/data/graph.db'
  end
  create_graph
end

get "/connections/:name" do |name|
 puts "doget"
 puts "x#{ $NEO4J_SERVER }x"

 me = Person.find("name: #{name}").first
  return unless me

  Hash[ me.in_love.collect{ |r| [:love,r.name + " yy" ] } ].to_json
end

  