extends Node2D

func _ready():
	if Gobal.door_name:
		var door_node = find_node(Gobal.door_name)
		if door_node:
			$YSort/player.position.x = 328
			$YSort/player.position.y = 70
