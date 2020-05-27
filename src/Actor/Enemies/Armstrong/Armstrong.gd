extends KinematicBody2D


onready var GRAVITY = ProjectSettings.get("physics/2d/default_gravity")
onready var SM = $StateMachine
onready var SPRITE = $Sprite
onready var DETECTOR_LEFT = $DetectorLeft
onready var DETECTOR_RIGHT = $DetectorRight
onready var ANIMATION_PLAYER = $AnimationPlayer

export var DEATH_VECTOR = Vector2(50, -220)
export var DESIRED_STATE = 1
export var SPEED = 50

var player_direction
var velocity = Vector2.ZERO


func apply_gravity(delta):
	velocity.y += GRAVITY * delta


func apply_movement():
	velocity = move_and_slide(velocity, Vector2.UP)


func handle_collisions():
	var direction = SPRITE.scale.x
	
	if not DETECTOR_LEFT.is_colliding():
		direction = 1
	elif not DETECTOR_RIGHT.is_colliding():
		direction = -1
	
	if is_on_wall():
		direction *= -1
	
	if direction != SPRITE.scale.x:
		SPRITE.scale.x = direction
	
	velocity.x = direction * SPEED


func handle_death():
	if SM.state != SM.States.DEAD:
		SM.state = SM.States.DEAD
		player_direction = Globals.PLAYER.SPRITE.scale.x
		
		velocity.x = DEATH_VECTOR.x * player_direction
		velocity.y = DEATH_VECTOR.y
	elif SM.state == SM.States.DEAD:
		rotation_degrees = clamp(rotation_degrees + 5 * player_direction, -90, 90)
