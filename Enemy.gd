extends Area2D

var dialogue = preload("res://dialogue.tscn")
# Called when the node enters the scene tree for the first time.


func _on_body_entered(body):
	if (body.is_in_group("Player")):
		var vec : Vector2 = Vector2(-5,480)
		body.set_position(vec)
		var d = dialogue.instantiate()
		d.messages = ["Oops, minor \n setback!"]
		body.add_child(d)
	
