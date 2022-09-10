extends Area2D

export(String, FILE, "*.tscn,*.scn") var new_scene

onready var Gobal = get_node("/root/Gobal")

func _input(event):
	if event.is_action_pressed("ui_accept"):
		if get_overlapping_bodies().size() > 0:
			
			next_level()
			

func next_level():
	var PTS = get_tree().change_scene(new_scene)
	Gobal.door_name = name
	
