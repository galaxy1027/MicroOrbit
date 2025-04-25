extends Node2D

@export var speed: float = 2.0
@export var deceleration: float = 1.0
var mouse_entered: bool
var velocity: float

func _ready() -> void:
	mouse_entered = false
	velocity = 0.0
	connect("mouse_entered", _on_mouse_entered)
	connect("mouse_exited", _on_mouse_exited)

func _physics_process(delta: float) -> void:
	position += transform.x * speed * delta
	while (velocity > 0):
		velocity -= deceleration * delta
		

func _on_mouse_entered() -> void:
	mouse_entered = true
	print_debug("Mouse entered player zone")
	
func _on_mouse_exited() -> void:
	mouse_entered = false
	print_debug("Mouse exited player zone")
