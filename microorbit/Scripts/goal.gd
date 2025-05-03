extends Area2D

signal win()


func _ready():
	connect("body_entered", _body_entered)
	
func _body_entered(body: Node):
	print("detected")
	if body.name.to_lower() == "player":
		emit_signal("win")
		print("player is winner")
		queue_free()
