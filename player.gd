extends KinematicBody2D

onready var weapon = $weapon 
const ACC = 25
var max_speed = 50
const FRICTION = 80

var motion = Vector2()
var is_running = null
const WALK_SPEED = 50
const RUN_SPEED = 80

func _physics_process(delta):
	var input = Vector2()
	input.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input = input.normalized()
	
	if Input.is_action_pressed("run"):
		is_running = true
	if Input.is_action_just_released("run"):
		is_running = false
	
	if input != Vector2.ZERO:
		if input.x > 0:
			$AnimatedSprite.flip_h = false
		elif input.x != 0:
			$AnimatedSprite.flip_h = true
		if is_running == true:
			$AnimatedSprite.play("run")
		else:
			$AnimatedSprite.play("walk")
		
		if is_running == true:
			max_speed = RUN_SPEED
		else:
			max_speed = WALK_SPEED
			
		motion += input * ACC * delta
		motion = motion.limit_length(max_speed * delta)
	else:
		motion = motion.move_toward(Vector2.ZERO, FRICTION * delta)
		$AnimatedSprite.play("idle")

	var _moveCollision = move_and_collide(motion) 


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("attack"):
		weapon.attack()
		
	
