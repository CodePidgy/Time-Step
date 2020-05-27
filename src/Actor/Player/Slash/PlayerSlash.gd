extends Node2D


onready var DETECT = $Detect

export var SPEED = 130


func _physics_process(delta):
	position.x += SPEED * scale.x * delta


func handle_hit(body):
	if "Armstrong" in body.name:
		body.ANIMATION_PLAYER.play("die")
