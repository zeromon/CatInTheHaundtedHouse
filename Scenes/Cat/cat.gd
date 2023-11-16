class_name Cat
extends CharacterBody2D


@export var SPEED:float = 100.0
@export var JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

signal hit

var current_speed:float
var check_point: Marker2D
var inventory:String

func _ready():
	current_speed = SPEED

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	#run
	if Input.is_action_pressed("run"):
		SPEED = current_speed*3
	if Input.is_action_just_released("run"):
		SPEED = current_speed
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func reset_position():
	hit.emit()
	# it using position from check point
	position = check_point.position

func _on_area_2d_area_entered(area:Area2D):
	if area.name == "Coin":
		var parent:CollectibleObj = area.get_parent()
		#print("collide area name "+parent._ColliderName)
		parent.queue_free()
	elif area.name == "Key":
		inventory = "Key"
		var parent:CollectibleObj = area.get_parent()
		parent.queue_free()
	elif area.name == "BodyGhost":
		#print("collide with ghost")
		reset_position()
	pass # Replace with function body.
