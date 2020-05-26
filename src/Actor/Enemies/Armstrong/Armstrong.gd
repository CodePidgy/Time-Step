extends KinematicBody2D


onready var GRAVITY = ProjectSettings.get("physics/2d/default_gravity")
onready var SM = $StateMachine
onready var SPRITE = $Sprite
onready var DETECTOR_LEFT = $DetectorLeft
onready var DETECTOR_RIGHT = $DetectorRight
onready var ANIMATION_PLAYER = $AnimationPlayer

export var DESIRED_STATE = 1
export var SPEED = 50

var velocity = Vector2.ZERO


func _ready():
	Globals.ARMSTRONG = self


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
