extends Area2D

signal kill_player()

@export var radius: float = 120
var angle: float = 0
var speed: float = 1.5
var center: Vector2

func _ready():
	connect("body_entered", _body_entered)
	center = self.position
	
func _body_entered(body: Node):
	print("detected")
	if body.name.to_lower() == "player":
		emit_signal("kill_player")
		print("player is kill")



func _process(delta):
	angle += delta * speed
	position.x = cos(angle) * radius + center.x
	position.y = sin(angle) * radius + center.y
