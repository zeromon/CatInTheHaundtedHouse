extends RigidBody2D

var is_collide_cat = false

func _on_body_entered(body):
	if body.name == "Cat":
		is_collide_cat = true
		var cat:Cat = body as Cat
		cat.reset_position()
		#cat reset position
	pass # Replace with function body.
