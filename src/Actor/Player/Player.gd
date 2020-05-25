extends KinematicBody2D


onready var GRAVITY = ProjectSettings.get("physics/2d/default_gravity")
onready var SPRITE = $Sprite

export var SPEED = 150
export var JUMP_VELOCITY = 350

var velocity = Vector2.ZERO


func apply_gravity(delta):
	velocity.y += GRAVITY * delta


func handle_move_input():
	var direction = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	velocity.x = direction * SPEED
	if direction != 0:
		SPRITE.scale.x = direction


func apply_movement():
	velocity = move_and_slide(velocity, Vector2.UP)
