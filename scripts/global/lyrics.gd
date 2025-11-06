extends Node

@onready var activated: Array[Dictionary] = []

const PEOPLE: Dictionary = {
	"friends_1" = {
		"name": "Buddies",
		"joyful": 5,
		"ironic": 0,
		"anxious": 0,
		"political": 0,
		"melancholy": 0
	},
	"friends_2" = {
		"name": "Pals",
		"joyful": 2,
		"ironic": 3,
		"anxious": 0,
		"political": 0,
		"melancholy": 0
	},
	"friends_3" = {
		"name": "Comrades",
		"joyful": 2,
		"ironic": 1,
		"anxious": 0,
		"political": 2,
		"melancholy": 0
	},
	"friends_4" = {
		"name": "Partners-in_Crime",
		"joyful": 0,
		"ironic": 4,
		"anxious": 0,
		"political": 1,
		"melancholy": 0
	},
	"funny_1"= {
		"name": "Laughter",
		"joyful": 5,
		"ironic": 0,
		"anxious": 0,
		"political": 0,
		"melancholy": 0
	},
	"funny_2"= {
		"name": "Giggle",
		"joyful": 4,
		"ironic": 0,
		"anxious": 1,
		"political": 0,
		"melancholy": 0
	},
	"funny_3"= {
		"name": "Joke",
		"joyful": 0,
		"ironic": 5,
		"anxious": 0,
		"political": 0,
		"melancholy": 0
	},
	"funny_4"= {
		"name": "Silly",
		"joyful": 4,
		"ironic": 1,
		"anxious": 0,
		"political": 0,
		"melancholy": 0
	},
	"lover_1"= {
		"name": "Love",
		"joyful": 4,
		"ironic": 0,
		"anxious": 0,
		"political": 1,
		"melancholy": 0
	},
	"lover_2"= {
		"name": "Kiss",
		"joyful": 5,
		"ironic": 0,
		"anxious": 0,
		"political": 0,
		"melancholy": 0
	},
	"lover_3"= {
		"name": "Baby",
		"joyful": 5,
		"ironic": 0,
		"anxious": 0,
		"political": 0,
		"melancholy": 0
	},
	"lover_4"= {
		"name": "Mine",
		"joyful": 3,
		"ironic": 0,
		"anxious": 2,
		"political": 0,
		"melancholy": 0
	},
	"enemy_1"= {
		"name": "Hate",
		"joyful": 0,
		"ironic": 0,
		"anxious": 5,
		"political": 0,
		"melancholy": 0
	},
	"enemy_2"= {
		"name": "Bite",
		"joyful": 0,
		"ironic": 1,
		"anxious": 2,
		"political": 2,
		"melancholy": 0
	},
	"enemy_3"= {
		"name": "Punch",
		"joyful": 0,
		"ironic": 0,
		"anxious": 4,
		"political": 1,
		"melancholy": 0
	},
	"enemy_4"= {
		"name": "Kick",
		"joyful": 0,
		"ironic": 0,
		"anxious": 3,
		"political": 2,
		"melancholy": 0
	},
	"parent_1"= {
		"name": "Disappointment",
		"joyful": 0,
		"ironic": 0,
		"anxious": 2,
		"political": 0,
		"melancholy": 3
	},
	"parent_2"= {
		"name": "Daddy Issues",
		"joyful": 0,
		"ironic": 3,
		"anxious": 1,
		"political": 0,
		"melancholy": 2
	},
	"parent_3"= {
		"name": "Rebel",
		"joyful": 0,
		"ironic": 0,
		"anxious": 0,
		"political": 3,
		"melancholy": 2
	},
	"parent_4"= {
		"name": "Disown",
		"joyful": 0,
		"ironic": 0,
		"anxious": 2,
		"political": 1,
		"melancholy": 2
	},
}

const WRITTEN: Dictionary = {
	"news_1" = {
		"name": "Pigeon",
		"joyful": 0,
		"ironic": 0,
		"anxious": 0,
		"political": 5,
		"melancholy": 0
	},
	"news_2" = {
		"name": "Bird-brain",
		"joyful": 0,
		"ironic": 2,
		"anxious": 0,
		"political": 3,
		"melancholy": 0
	},
	"news_3" = {
		"name": "War",
		"joyful": 0,
		"ironic": 0,
		"anxious": 1,
		"political": 4,
		"melancholy": 0
	},
	"news_4" = {
		"name": "Peace",
		"joyful": 3,
		"ironic": 0,
		"anxious": 0,
		"political": 2,
		"melancholy": 0
	},
	"news_5" = {
		"name": "Politician",
		"joyful": 0,
		"ironic": 1,
		"anxious": 0,
		"political": 4,
		"melancholy": 0
	},
	"news_6" = {
		"name": "Birds",
		"joyful": 0,
		"ironic": 0,
		"anxious": 0,
		"political": 5,
		"melancholy": 0
	},
	"news_7" = {
		"name": "Feathers",
		"joyful": 1,
		"ironic": 1,
		"anxious": 0,
		"political": 3,
		"melancholy": 0
	},
	"news_8" = {
		"name": "Flock",
		"joyful": 0,
		"ironic": 1,
		"anxious": 1,
		"political": 3,
		"melancholy": 0
	},
	"book_1" = {
		"name": "Death",
		"joyful": 0,
		"ironic": 0,
		"anxious": 0,
		"political": 0,
		"melancholy": 5
	},
	"book_2" = {
		"name": "Empire",
		"joyful": 0,
		"ironic": 2,
		"anxious": 0,
		"political": 2,
		"melancholy": 1
	},
	"book_3" = {
		"name": "Planet",
		"joyful": 2,
		"ironic": 0,
		"anxious": 0,
		"political": 0,
		"melancholy": 3
	},
	"book_4" = {
		"name": "Cosmic",
		"joyful": 3,
		"ironic": 0,
		"anxious": 0,
		"political": 0,
		"melancholy": 2
	},
	"book_5" = {
		"name": "Burn",
		"joyful": 0,
		"ironic": 0,
		"anxious": 1,
		"political": 1,
		"melancholy": 3
	},
	"book_6" = {
		"name": "Philosophy",
		"joyful": 0,
		"ironic": 5,
		"anxious": 0,
		"political": 0,
		"melancholy": 0
	},
	"book_7" = {
		"name": "Poison",
		"joyful": 0,
		"ironic": 0,
		"anxious": 1,
		"political": 0,
		"melancholy": 4
	},
	"book_8" = {
		"name": "Apocalypse",
		"joyful": 0,
		"ironic": 0,
		"anxious": 5,
		"political": 0,
		"melancholy": 0
	},
	"book_9" = {
		"name": "Legend",
		"joyful": 0,
		"ironic": 3,
		"anxious": 1,
		"political": 0,
		"melancholy": 1
	},
	"book_10" = {
		"name": "Mystery",
		"joyful": 0,
		"ironic": 0,
		"anxious": 1,
		"political": 0,
		"melancholy": 4
	},
	"book_11" = {
		"name": "Murder",
		"joyful": 0,
		"ironic": 0,
		"anxious": 5,
		"political": 0,
		"melancholy": 0
	},
	"book_12" = {
		"name": "Romance",
		"joyful": 3,
		"ironic": 0,
		"anxious": 0,
		"political": 0,
		"melancholy": 2
	},
}

const EXPLORE: Dictionary = {
	"city_1" = {
		"name": "Concrete",
		"joyful": 0,
		"ironic": 0,
		"anxious": 3,
		"political": 0,
		"melancholy": 2
	},
	"city_2" = {
		"name": "Steel",
		"joyful": 0,
		"ironic": 0,
		"anxious": 1,
		"political": 3,
		"melancholy": 1
	},
	"city_3" = {
		"name": "Picket Fence",
		"joyful": 0,
		"ironic": 2,
		"anxious": 3,
		"political": 0,
		"melancholy": 0
	},
	"city_4" = {
		"name": "Suburbia",
		"joyful": 3,
		"ironic": 2,
		"anxious": 0,
		"political": 0,
		"melancholy": 0
	},
	"city_5" = {
		"name": "Trash",
		"joyful": 0,
		"ironic": 0,
		"anxious": 0,
		"political": 3,
		"melancholy": 2
	},
	"city_6" = {
		"name": "Gutters",
		"joyful": 0,
		"ironic": 1,
		"anxious": 0,
		"political": 0,
		"melancholy": 4
	},
	"city_7" = {
		"name": "Empty Windows",
		"joyful": 0,
		"ironic": 0,
		"anxious": 0,
		"political": 0,
		"melancholy": 5
	},
	"city_8" = {
		"name": "Rats",
		"joyful": 0,
		"ironic": 2,
		"anxious": 0,
		"political": 3,
		"melancholy": 0
	},
	"city_9" = {
		"name": "Neighborhood",
		"joyful": 3,
		"ironic": 0,
		"anxious": 0,
		"political": 2,
		"melancholy": 0
	},
	"city_10" = {
		"name": "Cityscape",
		"joyful": 0,
		"ironic": 0,
		"anxious": 0,
		"political": 0,
		"melancholy": 0
	},
	"nature_1" = {
		"name": "Mother Nature",
		"joyful": 0,
		"ironic": 0,
		"anxious": 0,
		"political": 0,
		"melancholy": 0
	},
	"nature_2" = {
		"name": "Endless",
		"joyful": 0,
		"ironic": 0,
		"anxious": 0,
		"political": 0,
		"melancholy": 0
	},
	"nature_3" = {
		"name": "Autumn Leaves",
		"joyful": 0,
		"ironic": 0,
		"anxious": 0,
		"political": 0,
		"melancholy": 0
	},
	"nature_4" = {
		"name": "Spring Flowers",
		"joyful": 0,
		"ironic": 0,
		"anxious": 0,
		"political": 0,
		"melancholy": 0
	},
	"nature_5" = {
		"name": "Summer Heat",
		"joyful": 0,
		"ironic": 0,
		"anxious": 0,
		"political": 0,
		"melancholy": 0
	},
	"nature_6" = {
		"name": "Jack Frost",
		"joyful": 0,
		"ironic": 0,
		"anxious": 0,
		"political": 0,
		"melancholy": 0
	},
	"nature_7" = {
		"name": "Fresh Snow",
		"joyful": 0,
		"ironic": 0,
		"anxious": 0,
		"political": 0,
		"melancholy": 0
	},
	"nature_8" = {
		"name": "Rainstorm",
		"joyful": 0,
		"ironic": 0,
		"anxious": 0,
		"political": 0,
		"melancholy": 0
	},
	"nature_9" = {
		"name": "Thunder",
		"joyful": 0,
		"ironic": 0,
		"anxious": 0,
		"political": 0,
		"melancholy": 0
	},
	"nature_10" = {
		"name": "Sunshine",
		"joyful": 0,
		"ironic": 0,
		"anxious": 0,
		"political": 0,
		"melancholy": 0
	},
}

const DREAM: Dictionary = {
	"fear_1" = {
		"name": "Monster",
		"joyful": 0,
		"ironic": 0,
		"anxious": 2,
		"political": 3,
		"melancholy": 0
	},
	"fear_2" = {
		"name": "Disaster",
		"joyful": 0,
		"ironic": 0,
		"anxious": 2,
		"political": 0,
		"melancholy": 3
	},
	"fear_3" = {
		"name": "Failure",
		"joyful": 0,
		"ironic": 0,
		"anxious": 4,
		"political": 0,
		"melancholy": 1
	},
	"fear_4" = {
		"name": "Alone",
		"joyful": 0,
		"ironic": 0,
		"anxious": 5,
		"political": 0,
		"melancholy": 0
	},
	"fear_5" = {
		"name": "Clowns",
		"joyful": 0,
		"ironic": 3,
		"anxious": 2,
		"political": 0,
		"melancholy": 0
	},
	"fear_6" = {
		"name": "Cobweb",
		"joyful": 0,
		"ironic": 0,
		"anxious": 1,
		"political": 0,
		"melancholy": 4
	},
	"fear_7" = {
		"name": "Ghost",
		"joyful": 0,
		"ironic": 0,
		"anxious": 1,
		"political": 0,
		"melancholy": 4
	},
	"fear_8" = {
		"name": "Haunt",
		"joyful": 0,
		"ironic": 0,
		"anxious": 0,
		"political": 0,
		"melancholy": 5
	},
	"fear_9" = {
		"name": "Disappear",
		"joyful": 0,
		"ironic": 0,
		"anxious": 0,
		"political": 0,
		"melancholy": 5
	},
	"fear_10" = {
		"name": "Forget",
		"joyful": 0,
		"ironic": 0,
		"anxious": 2,
		"political": 0,
		"melancholy": 3
	},
	"fantasy_1" = {
		"name": "Fame",
		"joyful": 4,
		"ironic": 0,
		"anxious": 1,
		"political": 0,
		"melancholy": 0
	},
	"fantasy_2" = {
		"name": "Money",
		"joyful": 2,
		"ironic": 0,
		"anxious": 0,
		"political": 3,
		"melancholy": 0
	},
	"fantasy_3" = {
		"name": "Power",
		"joyful": 1,
		"ironic": 3,
		"anxious": 0,
		"political": 1,
		"melancholy": 0
	},
	"fantasy_4" = {
		"name": "Glory",
		"joyful": 3,
		"ironic": 2,
		"anxious": 0,
		"political": 0,
		"melancholy": 0
	},
	"fantasy_5" = {
		"name": "Hero",
		"joyful": 3,
		"ironic": 0,
		"anxious": 0,
		"political": 2,
		"melancholy": 0
	},
	"fantasy_6" = {
		"name": "Forever",
		"joyful": 1,
		"ironic": 0,
		"anxious": 4,
		"political": 0,
		"melancholy": 0
	},
	"fantasy_7" = {
		"name": "Gold",
		"joyful": 0,
		"ironic": 1,
		"anxious": 0,
		"political": 4,
		"melancholy": 0
	},
	"fantasy_8" = {
		"name": "Star",
		"joyful": 4,
		"ironic": 1,
		"anxious": 0,
		"political": 0,
		"melancholy": 0
	},
	"fantasy_9" = {
		"name": "King",
		"joyful": 2,
		"ironic": 0,
		"anxious": 0,
		"political": 3,
		"melancholy": 0
	},
	"fantasy_10" = {
		"name": "Independent",
		"joyful": 5,
		"ironic": 0,
		"anxious": 0,
		"political": 0,
		"melancholy": 0
	},
	"daydream_1" = {
		"name": "Magic",
		"joyful": 2,
		"ironic": 3,
		"anxious": 0,
		"political": 0,
		"melancholy": 0
	},
	"daydream_2" = {
		"name": "Zombies",
		"joyful": 0,
		"ironic": 0,
		"anxious": 1,
		"political": 4,
		"melancholy": 0
	},
	"daydream_3" = {
		"name": "Sword",
		"joyful": 3,
		"ironic": 0,
		"anxious": 0,
		"political": 2,
		"melancholy": 0
	},
	"daydream_4" = {
		"name": "Destiny",
		"joyful": 3,
		"ironic": 1,
		"anxious": 0,
		"political": 1,
		"melancholy": 0
	},
	"daydream_5" = {
		"name": "Spaceship",
		"joyful": 3,
		"ironic": 2,
		"anxious": 0,
		"political": 0,
		"melancholy": 0
	},
	"daydream_6" = {
		"name": "Heir",
		"joyful": 0,
		"ironic": 2,
		"anxious": 3,
		"political": 0,
		"melancholy": 0
	},
	"daydream_7" = {
		"name": "Throne",
		"joyful": 0,
		"ironic": 0,
		"anxious": 0,
		"political": 3,
		"melancholy": 2
	},
	"daydream_8" = {
		"name": "Journey",
		"joyful": 3,
		"ironic": 0,
		"anxious": 2,
		"political": 0,
		"melancholy": 0
	},
	"daydream_9" = {
		"name": "Beyond",
		"joyful": 1,
		"ironic": 0,
		"anxious": 2,
		"political": 0,
		"melancholy": 1
	},
	"daydream_10" = {
		"name": "Dreams",
		"joyful": 4,
		"ironic": 0,
		"anxious": 0,
		"political": 0,
		"melancholy": 1
	}
}

func _ready() -> void:
	for value in DREAM.values():
		activated.append(value)
