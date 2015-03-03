require 'open-uri'
require 'zlib'
require 'yajl'
require 'mongo'

mongo = Mongo::Connection.new
db = mongo['githubarchive']


#puts "Chargement des archives Github pour le 1er Janvier 2015"
#(0...23).each do |hour|
#	puts "Chargement de l'heure : #{hour}"
#	gz = open("http://data.githubarchive.org/2015-01-01-#{hour}.json.gz")
#	js = Zlib::GzipReader.new(gz).read
#	 
#	Yajl::Parser.parse(js) do |event|
#		event['created_at'] = Time.parse(event['created_at'])
#		db['events'] << event
#	end
#end


# Nombre d'event par heure
# count = db['events'].aggregate([
# 	{:$group=>{:_id=>{ hour: {:$hour=>"$created_at"}}, :count=>{:$sum => 1}}}
# ])


# Tous les types
#types = db['events'].aggregate([
#	{:$group => {:_id => "$type"}}
#])
#puts types


# Nombre d'event par heure et par type
# count = db['events'].aggregate([
# 	{:$group=>{:_id=>{ hour: {:$hour=>"$created_at"}, type: "$type"}, :count=>{:$sum => 1}}}
# ])


# Nombre d'event par type du repo "rails/rails"
# count = db['events'].aggregate([
# 	{:$match=>{ "repo.name" => "rails/rails"}},
# 	{:$group=>{:_id=>{ hour: {:$hour=>"$created_at"}, type: "$type"}, :count=>{:$sum => 1}}}
# ])


# Les repos qui ont un nombre d'event superieur à 10000
# count = db['events'].aggregate([
# 	{:$group=>{:_id=>{ name: "$repo.name"}, :count=>{:$sum => 1}}},
# 	{:$match=>{:count=>{ :$gt => 10000 }}}
# ])


# Le repo qui a le plus d'event
# count = db['events'].aggregate([
# 	{:$group=>{:_id=>{ name: "$repo.name"}, :count=>{:$sum => 1}}},
# 	{:$sort=>{:count=>-1}},
# 	{:$limit=>1}
# ])

# Les 5 auteurs les plus actif par heure
# count = db['events'].aggregate([
# 	{:$group=>{:_id =>{ hour: {:$hour=>"$created_at"}, :user=>"$actor.id"}, :count =>{:$sum => 1}}},
# 	{:$sort=>{:count=>-1}},
# 	{:$limit=>5}
# ])


# puts count