extends KinematicBody2D


onready var GRAVITY = ProjectSettings.get("physics/2d/default_gravity")
onready var SM = $StateMachine
onready var SPRITE = $Sprite
onready var COLLISION = $CollisionShape2D
onready var ANIMATION_PLAYER = $AnimationPlayer

export var SPEED = 150
export var JUMP_VELOCITY = 350
export var LAUNCH_SPEED = 700

var attacking = false
var velocity = Vector2.ZERO


func _ready():
	Globals.PLAYER = self


func apply_gravity(delta):
	velocity.y += GRAVITY * delta


func apply_movement():
	velocity = move_and_slide(velocity, Vector2.UP)


func handle_move_input():
	var direction = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	velocity.x = direction * SPEED
	if direction != 0:
		SPRITE.scale.x = direction


func handle_launch():
	velocity = Vector2(0, -LAUNCH_SPEED)
	COLLISION.set_deferred("disabled", true)


func handle_attack():
	if ANIMATION_PLAYER.get_current_animation() == "":
		attacking = false
	else:
		attacking = true
		velocity = Vector2.ZERO
