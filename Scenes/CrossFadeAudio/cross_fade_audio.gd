extends Node2D

## start time for audio
@export var next_audio_start:float= 0
@export var audio1:AudioStream
#@export var audio2:AudioStream
@export_range(0, 24) var audio1_db_volume: float
#@export_range(0, 24) var audio2_db_volume: float

func _ready():
	$Audio1.stream = audio1
#	$Audio2.stream = audio2
	$Audio1.volume_db = audio1_db_volume
#	$Audio2.volume_db = audio2_db_volume

func audio_play():
	$Audio1.play(next_audio_start)
	
func fade_audio():
	$AnimationPlayer.play("fadeout")
#	$Audio2.play(next_audio_start)
#	$Audio2.play(2)

func _on_animation_player_animation_finished(anim_name):
	$Audio1.stop()
	pass # Replace with function body.
