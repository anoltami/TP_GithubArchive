require 'open-uri'
require 'zlib'
require 'yajl'
require 'mongo'

mongo = Mongo::Connection.new
db = mongo['githubarchive']
 
gz = open('http://data.githubarchive.org/2015-01-01-12.json.gz')
js = Zlib::GzipReader.new(gz).read
 
Yajl::Parser.parse(js) do |event|
	db['events'] << event
end