extends CharacterBody2D


func launch(force: Vector2) -> void:
    velocity += force

func _physics_process(delta: float) -> void:
    position += velocity * delta
    velocity.move_toward(Vector2.ZERO, delta)
