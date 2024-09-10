extends CharacterBody2D

var grid_size: int = 150
var move_speed: float = 300.0
var target_position: Vector2 = Vector2.ZERO
var is_moving: bool = false
var movement_progress: float = 0.0

func _ready() -> void:
	snap_to_grid()

func _physics_process(delta: float) -> void:
	handle_input()
	if is_moving:
		move_to_target(delta)

func handle_input() -> void:
	if is_moving:
		return
	
	var direction = Vector2.ZERO
	if Input.is_action_just_pressed("ui_right"):
		direction = Vector2.RIGHT
	elif Input.is_action_just_pressed("ui_left"):
		direction = Vector2.LEFT
	elif Input.is_action_just_pressed("ui_down"):
		direction = Vector2.DOWN
	elif Input.is_action_just_pressed("ui_up"):
		direction = Vector2.UP
	
	if direction != Vector2.ZERO:
		set_target_position(direction)

func set_target_position(direction: Vector2) -> void:
	target_position = snap_to_grid(global_position + direction * grid_size)
	is_moving = true
	movement_progress = 0.0

func move_to_target(delta: float) -> void:
	movement_progress += delta * (move_speed / grid_size)
	if movement_progress >= 1.0:
		global_position = target_position
		is_moving = false
	else:
		global_position = global_position.lerp(target_position, movement_progress)

func snap_to_grid(pos: Vector2 = global_position) -> Vector2:
	var snapped = (pos / grid_size).floor() * grid_size
	return snapped + Vector2(grid_size / 2, grid_size / 2)
