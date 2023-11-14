extends Node2D

@onready var check_point:Marker2D = $CheckPoints/CheckPoint1

@onready var cat:Cat = $Cat
@onready var door1:Door = $Door1

func _ready():
	cat.position = check_point.global_position
	cat.check_point = check_point


func _on_enter_room_2_enter_area():
	door1.change_status(Door.STATUS.CLOSE)
	pass # Replace with function body.
