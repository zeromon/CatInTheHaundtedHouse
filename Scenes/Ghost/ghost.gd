extends CharacterBody2D

@export var speed:float = 50
@export var cat:Cat

var _direction:Vector2

func _ready():
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


func _on_audio_ghost_finished():
	$AudioGhost.play()
	pass # Replace with function body.
