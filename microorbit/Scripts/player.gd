extends CharacterBody2D

@export var max_length: float = 20
var start_pos: Vector2
@export var friction_multiplier: float = 0.99

@onready var text = get_node("Label")

func _ready() -> void:
	start_pos = self.global_position
	text.visible = false
	_reset()
	
func _reset() -> void:
	position = start_pos
	velocity = Vector2.ZERO

func launch(force: Vector2) -> void:
	velocity += force
	# print(velocity)
	print(force)
		
func kill_player() -> void:
	print("no...")
	_reset()
		
func _physics_process(delta: float) -> void:
	velocity.limit_length(max_length)
	position += velocity * delta
	velocity.move_toward(Vector2.ZERO, delta)
	velocity *= friction_multiplier
	move_and_slide()
	

func winner():
	print("I WIN")
	text.visible = true
	pass
