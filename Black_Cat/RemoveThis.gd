extends CharacterBody2D

@onready var anim = $AnimationPlayer
const GRAVITY = 9.8
@onready var motion = Vector2.ZERO
@onready var audio_stream_player = $AudioStreamPlayer

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
	
	handle_audio_output() #<--jump audio is bugged, probably to do with _physics process
	
	if Input.is_action_just_pressed("Flashlight"):
		toggle_the_flashlight()
	
	
	
	
	pass





func _physics_process(delta):
	player_movement_and_animation()
	
	pass




func handle_audio_output():
#/audio scripts
	if Input.is_action_just_pressed("ui_down"):
		var purr = load("res://Black_Cat/Audio/SFX/Purr/Purr.mp3")
		audio_stream_player.stream = purr
		audio_stream_player.play()
		print(str(audio_stream_player.stream))
	elif Input.is_action_just_released("ui_down"):
		audio_stream_player.stop()
	
	#/cant get the bastard to meow when they jump
#	if Input.is_action_just_released("jump"):
#		var meow = load("res://Black_Cat/Audio/SFX/Mew/meow-1.mp3")
#		audio_stream_player.stream = meow
#		audio_stream_player.play()
	
	#//Hold "E" for a great time
	#------------------>  GAG REPLACE WITH PREFERED AUDIO  <---------------------
	if Input.is_action_just_pressed("Interact"):
		var nyan = load("res://Black_Cat/Audio/SFX/Mew/nyan_cat_compressed.mp3") #<---replace this with audio path
		audio_stream_player.stream = nyan
		audio_stream_player.play()
		print(str(audio_stream_player.stream))
	elif Input.is_action_just_released("Interact"): # and then delete this block
		audio_stream_player.stop()
	
	#/hissing noise
	if Input.is_action_just_pressed("taunt"):
		var hiss = load("res://Black_Cat/Audio/SFX/Mew/alligator3.mp3")
		audio_stream_player.stream = hiss
		audio_stream_player.play()
		print(str(audio_stream_player.stream))
	if Input.is_action_just_released("taunt"):
		audio_stream_player.stop()
	pass


func toggle_the_flashlight():
	if $PointLight2D2.visible:
		$PointLight2D2.visible = false
	else:
		$PointLight2D2.visible = true
	pass


func player_movement_and_animation():
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
			#plays anim
			anim.play("sit")
			#changes label text
			$Label.text = ('what a hard day')
		
		elif Input.is_action_pressed("taunt"):
			anim.play("Hissing")
		
		elif Input.is_action_pressed("Interact"):
			anim.play("Interact")
		
		else:
			anim.play("Idle")
			$Label.text = ''
			
		if Input.is_action_just_released("jump"):
			velocity.y -= jump_height
			
			var meow = load("res://Black_Cat/Audio/SFX/Mew/meow-1.mp3")
			audio_stream_player.stream = meow
			audio_stream_player.play()

	else:
		if velocity.y < 0:
			anim.play("Jump")
		if velocity.y > 0:
			anim.play("Fall")
			$Label.text = ('oh shit, ohshit, OHSHIT')
		$AudioStreamPlayer.stop()
		
	pass
