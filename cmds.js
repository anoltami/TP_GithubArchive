db.events.aggregate([{$group: {_id: "$type"}}])

db.events.find(
	{"repo.name": {$regex : "rails/.*"}}
)