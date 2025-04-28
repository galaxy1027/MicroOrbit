extends Area2D

signal vector_created(vector)
@export var max_length: float = 50.0

const MAX_FORCE: float = 50.0
var start_pos: Vector2 = Vector2.ZERO
var end_pos: Vector2 = Vector2.ZERO
var clicking: bool = false
var vector: Vector2 = Vector2.ZERO

func _ready():
    _reset()
    connect("input_event", _input_event)
    
func _reset():
    start_pos = Vector2.ZERO
    end_pos = Vector2.ZERO
    vector = Vector2.ZERO
    queue_redraw() # update to draw no vector

func _draw():
    draw_line(self.position, end_pos, Color.DARK_CYAN, 8)
    
func _input(event) -> void:
    if not clicking:
        return
    elif event.is_action_released("click"):
        clicking = false
        emit_signal("vector_created", vector)
        _reset()
    elif event is InputEventMouseMotion:
        end_pos = get_local_mouse_position()
        vector = -(end_pos - start_pos).limit_length(MAX_FORCE)
        queue_redraw() # mouse was moved, redraw vector

func _input_event(_viewport, event, _shape_idx):
    if (Input.is_action_pressed("click")):
        clicking = true
        start_pos = self.global_position
