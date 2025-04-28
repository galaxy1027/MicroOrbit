extends CharacterBody2D

const MAX_VELOCITY: Vector2 = Vector2(5, 5)
const START_POS: Vector2 = Vector2(0, 0)

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
    velocity.limit_length(20)
    position += velocity * delta
    velocity.move_toward(Vector2.ZERO, delta)
    
