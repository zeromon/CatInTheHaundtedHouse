extends Area2D

@export var check_point:Marker2D

signal enter_area
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_exited(body:Node2D):
	if body.name == "Cat":
		print("Cat enter area")
		var cat:Cat = body as Cat
		cat.check_point = check_point
		enter_area.emit()
		disable_collision()
#		queue_free()
	pass # Replace with function body.

func disable_collision():
	set_deferred("monitorable", false)
	set_deferred("monitoring", false)
