class_name Door
extends StaticBody2D

enum STATUS{OPEN, CLOSE}
@export var _status:STATUS = STATUS.OPEN
var door_sprite:Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	door_sprite = $Sprite2D
	if _status == STATUS.OPEN:
		$CollisionShape2D.set_deferred("disabled", true)
		door_sprite.visible = true
	elif _status == STATUS.CLOSE:
		$CollisionShape2D.set_deferred("disabled", false)
		door_sprite.visible = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func change_status(status:STATUS):
	if status == STATUS.OPEN:
		$CollisionShape2D.set_deferred("disabled", true)
		door_sprite.visible = true
	elif status == STATUS.CLOSE:
		$CollisionShape2D.set_deferred("disabled", false)
		door_sprite.visible = false
