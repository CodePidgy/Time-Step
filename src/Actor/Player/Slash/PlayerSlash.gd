extends Node2D


export var SPEED = 100


func _physics_process(delta):
	position.x += SPEED * scale.x * delta
