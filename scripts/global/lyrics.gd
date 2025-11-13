extends Node

@onready var activated: Array[Dictionary] = []


const EMO: Dictionary = {
	Emo1 = [
		{
			"name" : "Baby",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "I love you",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "Die for me",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "Prom",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "Zombie",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "Scary",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "My life",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "Teenagers",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "Sad",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "Nothing",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
	],
	
	AlmostPop1 = [
		{
			"name" : "Queen",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "Be mine",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "Sweet",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "Beautiful",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
	],
	
	AlmostPop2 = [
		{
			"name" : "Juliet",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "Friday night",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "Lipstick",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
	],
	
	AlmostPop3 = [
		{
			"name" : "Champagne",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "Spring Break",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "Glitter",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
	],
	
	DaddyIssues1 = [
		{
			"name" : "Daddy",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "Make you proud",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "Disappointment",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
	],
	
	DaddyIssues2 = [
		{
			"name" : "Total failure",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "Holding out",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "Blindsided",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "Hoping for a call",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
	],
	
	DaddyIssues3 = [
		{
			"name" : "Never knew you",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "Empty trophies",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "Far from home",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
	],
	
	DanceDance1 = [
		{
			"name" : "Dance with me",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "Heartbeat",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "Rhythm",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "Move your body",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "Follow me",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
	],
	
	DanceDance2 = [
		{
			"name" : "Twist",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "Slide",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "Clamp",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "Shake",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "Stomp",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "Jump",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
	],
	
	DarkAndEdgy1 = [
		{
			"name" : "Death",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "Darkness",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "Shadows",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
	],
	
	DarkAndEdgy2 = [
		{
			"name" : "Phantom",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "Ghost",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "Vampire",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
	],
	
	DarkAndEdgy3 = [
		{
			"name" : "Vulture",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "Ravens",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "Murder",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "Haunted",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
	],
	
	DoomedLove1 = [
		{
			"name" : "Forbidden",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "Romeo",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "Starcrossed",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
	],
	
	DoomedLove2 = [
		{
			"name" : "Stay with me",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "Goodbye",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "Forever",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
	],
	
	DoomedLove3 = [
		{
			"name" : "Candles",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "Moonlight",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "Wilting",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "Thorns",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
	],
	
	HeartThrob1 = [
		{
			"name" : "Romance",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "Serenade",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "Love me",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
	],
	
	HeartThrob2 = [
		{
			"name" : "Tonight",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "All night",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "Hormones",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "Awake",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
	],
	
	HeartThrob3 = [
		{
			"name" : "Bedsheets",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "Red wine",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "Rose petals",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
	],
	
	HurtNoComfort1 = [
		{
			"name" : "Shattering",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "Miss you",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "Without you",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		}
	],
	
	HurtNoComfort2 = [
		{
			"name" : "Lying",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "Hurt",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "Crying",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		}
	],
	
	HurtNoComfort3 = [
		{
			"name" : "Blood",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "Injury",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "Fatal",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "Dying",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		}
	],
	
	NaNaNonsense1 = [
		{
			"name" : "Na na na na",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "La la la",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "Yeah yeah",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		}
	],
	
	NaNaNonsense2 = [
		{
			"name" : "Yuh",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "Ooh!",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "Ow!",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "Haha!",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		}
	],
	
	NaNaNonsense3 = [
		{
			"name" : "Zoinks!",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "Yipee!",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "Zowee!",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		}
	],
	
	RedFlags1 = [
		{
			"name" : "Toxic",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "Obsession",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "Chained",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		}
	],
	
	RedFlags2 = [
		{
			"name" : "Stalker",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "Need you",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "Ribcage",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "Teeth",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		}
	],
	
	RedFlags3 = [
		{
			"name" : "Keep you here",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "Play games",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "Like animals",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		}
	],
	
	TeenAngst1 = [
		{
			"name" : "Drama",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "Mourn",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "Dark",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "Doomed",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "Tragedy",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		}
	],
	
	TeenAngst2 = [
		{
			"name" : "Funeral",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "Bullet",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "Cut",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "Kill",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		},
		{
			"name" : "Bleed",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		}
	]
}

const PUNK: Dictionary = {
	Punk1 = [
		{
			"name" : "",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		}
	],
		
	BrainSick1 = [
		{
			"name" : "",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		}
	],
	
	BurnItDown1 = [
		{
			"name" : "",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		}
	],
	
	Decay1 = [
		{
			"name" : "",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		}
	],
	
	FightTheMan1 = [
		{
			"name" : "",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		}
	],
	
	Headbangers1 = [
		{
			"name" : "",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		}
	],
	
	MoshPit1 = [
		{
			"name" : "",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		}
	],
	
	Outsider1 = [
		{
			"name" : "",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		}
	],
	
	ProProtest1 = [
		{
			"name" : "",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		}
	],
	
	RadioRebel1 = [
		{
			"name" : "",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		}
	],
	
	RageEtc1 = [
		{
			"name" : "",
			"joyful" : 0,
			"ironic" : 0,
			"anxious" : 0,
			"political" : 0,
			"melancholy" : 0
		}
	]
}
