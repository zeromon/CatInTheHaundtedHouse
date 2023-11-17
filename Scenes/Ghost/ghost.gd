class_name Ghost
extends CharacterBody2D

@export var speed:float = 50
@export var cat:Cat

var start_position:Vector2

var _direction:Vector2

func _ready():
	start_position = global_position
	#only active when in room 2
	set_physics_process(false)
	pass

func _physics_process(delta):
	_direction = cat.global_position-global_position
	velocity = _direction.normalized() * speed
	move_and_slide()
	pass
	
func set_moving(value:bool):
	if value:
		$AudioGhost.play()
	else:
		$AudioGhost.stop()
	set_physics_process(value)

func reset_position():
	global_position = start_position


func _on_audio_ghost_finished():
	$AudioGhost.play()
	pass # Replace with function body.
