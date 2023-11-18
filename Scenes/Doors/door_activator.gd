extends Node2D

var is_on_area = false

@export var door:Door

var inventory:String
var cat:Cat

func _process(delta):
	if Input.is_key_pressed(KEY_E) and is_on_area:
		cat.action_animation()
		#activate door
		if inventory == "Key":
			door.change_status(Door.STATUS.OPEN)
		pass

func _on_area_2d_body_entered(body):
	if body.name == "Cat":
		print("cat")
		$Label.show()
		is_on_area = true
		inventory = body.inventory
		cat = body as Cat
	pass # Replace with function body.


func _on_area_2d_body_exited(body):
	if body.name == "Cat":
		$Label.hide()
		is_on_area = false
		cat = null
	pass # Replace with function body.
