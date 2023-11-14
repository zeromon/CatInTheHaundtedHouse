class_name MovingObject
extends CharacterBody2D

@export var _ray_cast:RayCast2D
@export var _speed:float = 50
#@export var cat:Cat
var direction:Vector2 = Vector2.ZERO
var is_ground:bool = false
var cat:Cat

func _ready():
	cat = get_tree().current_scene.get_node("Cat")
	pass

func _physics_process(_delta):
	if _ray_cast.is_colliding():
		#get target direction
		direction = _ray_cast.target_position
		velocity = direction.normalized()*_speed
		if not is_ground:
			look_at(cat.global_position)
	if velocity != Vector2.ZERO and not is_ground:
		#look_at(cat.global_position)
		move_and_slide()
	pass


func _on_body_moving_object_body_entered(body):
#	print("collide with "+body.name)
	is_ground = true
	$BodyMovingObject.set_deferred("monitorable",false)
	$BodyMovingObject.set_deferred("monitoring", false)
	if body.name == "Cat":
		var cat_body = body as Cat
		cat_body.hit.emit()
		queue_free()
		#cat live -1
#	is_ground= true
	pass # Replace with function body.
