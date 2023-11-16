class_name DoorExit
extends Node2D

var is_in_area = false
signal exit_door(val)
@export var door_name:String

func _process(delta):
#	if Input.is_key_pressed(KEY_E) and is_in_area:
#		exit_door.emit(door_name)
#		pass
	pass

func _input(event):
	if event.is_action_pressed("action") and is_in_area:
		exit_door.emit(door_name)
	pass

func _on_area_2d_body_entered(body):
	if body.name == "Cat":
		$Label.show()
		is_in_area = true
	pass # Replace with function body.


func _on_area_2d_body_exited(body):
	$Label.hide()
	is_in_area = false
	pass # Replace with function body.

func play_audio():
	$AudioDoor.play()


func _on_audio_door_finished():
	$AudioDoor.play()
	pass # Replace with function body.
