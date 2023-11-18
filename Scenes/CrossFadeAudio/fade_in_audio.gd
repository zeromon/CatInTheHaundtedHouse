extends Node2D

@export var audio: AudioStream

func _ready():
	$Audio1.stream = audio

func fade_in_audio():
	$Audio1.play()
	$AnimationPlayer.play("fade_in")
