extends CharacterBody2D

@onready var anim = $AnimationPlayer
const GRAVITY = 9.8
@onready var motion = Vector2.ZERO

enum STATES {
	idle = 0,
	walk,
	jump,
	fall,
}

@onready var _state = STATES.idle
var next_state

@export var CAT_STATS = {
	'walk_speed' : 350,
	'jump_velocity' : 500
}

@onready var jump_height = CAT_STATS.jump_velocity
@onready var walk_speed = CAT_STATS.walk_speed
@onready var ray_cast_2d = $RayCast2D

func _ready():
	add_to_group("Player")
	pass


func _input(event):
	if Input.is_action_just_pressed("Flashlight"):
		if $PointLight2D2.visible:
			$PointLight2D2.visible = false
		else:
			$PointLight2D2.visible = true
	
	pass





func _physics_process(delta):
	var h_input_dir = Input.get_axis('ui_left', 'ui_right')
	var v_input_dir = Input.get_axis('ui_up', "ui_down")
	var direction = Vector2(h_input_dir, v_input_dir)
	var on_floor : bool
	
	if ray_cast_2d.is_colliding():
		on_floor = true
	else:
		on_floor = false
	
	if not on_floor:
		velocity.y += GRAVITY 
	
	
	
	velocity.x = direction.x * walk_speed
	
	
	move_and_slide()
	
	
	if direction.x <= -1:
		$AnimatedSprite2D.flip_h = true
	else:
		$AnimatedSprite2D.flip_h = false
	
	if on_floor:
		if direction.x != 0:
			anim.play("walk")
			$Label.text = str("I'm fast as fuck, boi")
		
		elif Input.is_action_pressed("ui_down"):
			anim.play("sit")
			$Label.text = ('what a hard day')
		
		elif Input.is_action_pressed("taunt"):
			anim.play("Hissing")
		
		elif Input.is_action_pressed("Interact"):
			anim.play("Interact")
		
		else:
			anim.play("Idle")
			$Label.text = ''
			
		if Input.is_action_just_pressed("jump"):
			velocity.y -= jump_height
			
	else:
		if velocity.y < 0:
			anim.play("Jump")
		if velocity.y > 0:
			anim.play("Fall")
			$Label.text = ('oh shit, ohshit, OHSHIT')
		
	
	pass




func change_state():
	_state = next_state
	pass


