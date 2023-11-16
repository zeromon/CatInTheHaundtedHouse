class_name Door
extends StaticBody2D

enum STATUS{OPEN, CLOSE}
@export var _status:STATUS = STATUS.OPEN

# Called when the node enters the scene tree for the first time.
func _ready():
	if _status == STATUS.OPEN:
		$CollisionShape2D.set_deferred("disabled", true)
	elif _status == STATUS.CLOSE:
		$CollisionShape2D.set_deferred("disabled", false)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func change_status(status:STATUS):
	if status == STATUS.OPEN:
		$CollisionShape2D.set_deferred("disabled", true)
	elif status == STATUS.CLOSE:
		$CollisionShape2D.set_deferred("disabled", false)
