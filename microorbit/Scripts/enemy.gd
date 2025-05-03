extends Area2D

signal kill_player()


func _ready():
	connect("body_entered", _body_entered)
	
func _body_entered(body: Node):
	print("detected")
	if body.name.to_lower() == "player":
		emit_signal("kill_player")
		print("player is kill")
