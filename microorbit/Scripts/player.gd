extends CharacterBody2D

const START_POS: Vector2 = Vector2(0, 0)
const FRICTION: float = 0.5
const MAX_SPEED: float = 100

func _ready() -> void:
	_reset()
	
func _reset() -> void:
	position = START_POS
	velocity = Vector2.ZERO

func launch(force: Vector2) -> void:
	velocity += force
	print(velocity)
		
func kill_player() -> void:
	print("no...")
	_reset()
		
func _physics_process(delta: float) -> void:
	position += velocity * delta
	print(velocity.length())
	velocity = velocity.limit_length(MAX_SPEED)
	velocity.x = velocity.x * (1 - FRICTION * delta)
	velocity.y = velocity.y * (1 - FRICTION * delta)
