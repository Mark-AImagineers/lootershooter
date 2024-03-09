# directions right = x+1, left = x-1, up = y-1, down = y+1

extends CharacterBody2D

@export var speed = 200
@onready var animation_tree = $AnimationTree
var direction: Vector2 = Vector2.ZERO

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

func _physics_process(delta):
	get_input()
	move_and_slide()

func _process(delta):
	direction = Input.get_vector("left", "right", "up", "down")
	
	if direction != Vector2.ZERO:
		set_running(true)
		update_blend_position()
	else:
		set_running(false)
		
func set_running(value):
	animation_tree["parameters/conditions/is_running"] = value
	animation_tree["parameters/conditions/idle"] = not value
	
func update_blend_position():
	animation_tree["parameters/Idle/blend_position"] = direction
	animation_tree["parameters/Run/blend_position"] = direction
	
