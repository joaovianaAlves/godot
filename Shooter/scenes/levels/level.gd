extends Node
@onready var logo = $Logo

func _ready():
	logo.rotation_degrees = 90

func _process(delta):
	logo.rotation_degrees += 10
	
	if logo.rotation_degrees > 180:
		logo.rotation_degrees = 10
		
	if logo.position.x > 1000:
		logo.pos.x = 0
