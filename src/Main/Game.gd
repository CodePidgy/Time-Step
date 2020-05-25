extends Node


onready var TIMER = $Timer

var started = false
var level = 1


func _ready():
	Globals.GAME = self
	go_to_next_level(true)


func _input(event):
	if not started and event.is_action_pressed("jump"):
		started = true
		TIMER.start()
		Globals.PLAYER.SM.state = Globals.PLAYER.SM.States.IDLE


func _load_next_level():
	var next_level_resource = load("res://src/Level/Level" + str(level) + ".tscn")
	var next_level = next_level_resource.instance()
	return next_level


func _load_current_level():
	var current_level = get_node("Level" + str(level))
	return current_level


func go_to_next_level(first = false):
	started = false
	if not first:
		remove_child(_load_current_level())
		level += 1
	add_child(_load_next_level())
