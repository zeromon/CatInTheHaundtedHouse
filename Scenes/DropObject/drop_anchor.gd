extends PinJoint2D

#@export var _cat:Cat
var is_drop = false
var ray_cast:RayCast2D

# Called when the node enters the scene tree for the first time.
func _ready():
	ray_cast = $RayCast2D
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# drop object when cat collide with raycast
	if not is_drop:
		if ray_cast.is_colliding():
			node_b = ""
			is_drop = true
	pass
