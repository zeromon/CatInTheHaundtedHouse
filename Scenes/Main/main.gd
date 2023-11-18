extends Node2D

@onready var check_point:Marker2D = $CheckPoints/CheckPoint1

@onready var cat:Cat = $Cat
@onready var door1:Door = $Door1
@onready var door2:Door = $Door2

#all exit doors
@export var exit_doors:Array[DoorExit]

var true_door_exit_name:String = ""
var lives:int = 9
@onready var lives_label:Label = $HUD/LivesLabelValue

func _ready():
	cat.position = check_point.global_position
	cat.check_point = check_point
	lives_label.set_text(str(lives))
	$AudioBackgrounds/CrossFadeAudio1.audio_play()
	for i in range(100):
		var random = randi_range(-1, exit_doors.size()-1)
		#print(random)
	randomize()


func _on_enter_room_2_enter_area():
	#close door, set check point and activate ghost
	door1.change_status(Door.STATUS.CLOSE)
	$Ghost.set_moving(true)
	$AudioBackgrounds/CrossFadeAudio1.fade_audio()
	$AudioBackgrounds/CrossFadeAudio2.audio_play()
#	$AudioBackgrounds/AudioBackground.stop()
#	$AudioBackgrounds/AudioBackground2.play()
	pass # Replace with function body.


func _on_enter_room_3_enter_area():
	door2.change_status(Door.STATUS.CLOSE)
	$Ghost.set_moving(false)
	$AudioBackgrounds/CrossFadeAudio2.fade_audio()
	$AudioBackgrounds/FadeInAudio.fade_in_audio()
#	$AudioBackgrounds/AudioBackground2.stop()
#	$AudioBackgrounds/AudioBackground3.play()
	pass # Replace with function body.


func _on_door_exit_exit_door(val):
	if true_door_exit_name == "":
		# create random
		var random = randi_range(0, exit_doors.size()-1)
		# get door name
		true_door_exit_name = exit_doors[random].door_name
		# play audio
		exit_doors[random].play_audio()
		#reset cat position
		cat.position = cat.check_point.position
	elif true_door_exit_name == val:
		#game over
		get_tree().paused = true
		$GameFinishUI.show()
		pass
	elif true_door_exit_name != val:
		cat.position = cat.check_point.position
	pass # Replace with function body.


func _on_button_pressed():
	get_tree().reload_current_scene()
	get_tree().paused = false
	pass # Replace with function body.


func _on_cat_hit():
	lives -= 1
	if lives <1:
		get_tree().paused = true
		$GameOverUI.show()
	lives_label.set_text(str(lives))
	pass # Replace with function body.
