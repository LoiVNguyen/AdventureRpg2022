extends KinematicBody2D

export (int) var health := 50


var speed = 25
var motion = Vector2.ZERO

var player = null


func _physics_process(delta):
	motion = Vector2.ZERO
	if player:
		motion = position.direction_to(player.position) * speed
	motion = move_and_slide(motion)
	

func _on_detection_area_body_entered(body):
	player = body
	

func _on_detection_area_body_exited(body):
	player = null


func handle_hit(damage: int):
	health -= damage
	if health <= 0:
		death_of_slime()
		
		
func death_of_slime():
	queue_free()
	
