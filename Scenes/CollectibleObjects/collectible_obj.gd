class_name CollectibleObj
extends Node2D

@export var _ColliderName:String

func play_audio():
	$PickUpAudio.play()

func _on_pick_up_audio_finished():
	queue_free()
	pass # Replace with function body.
