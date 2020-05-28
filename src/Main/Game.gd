extends Node


onready var CLONE = preload("res://src/Actor/Orb/Orb.tscn")
onready var BATTERY_UI = $CanvasLayer2/BatteryUI
onready var SWITCHLEVEL_TIMER = $SwitchLevel
onready var TIMER = $Timer
onready var TIMER_UI = $CanvasLayer/UI/Label
onready var GAMEOVER_UI = $CanvasLayer/UI/Label2

var previous_orders = []
var left_over_time = 0
var level = 1
var level_time = 10
var num_enemies = 1
var started = false


func _ready():
	Globals.GAME = self
	go_to_next_level(true)


func _physics_process(_delta):
	TIMER_UI.text = str(round(TIMER.get_time_left())) if not TIMER.is_stopped() else str(level_time + left_over_time)


func _input(event):
	if not started and event.is_action_pressed("jump"):
		started = true
		TIMER.start(level_time + left_over_time)
		Globals.PLAYER.SM.state = Globals.PLAYER.SM.States.IDLE


func _load_next_level():
	var next_level_resource = load("res://src/Level/Level" + str(level) + ".tscn")
	var next_level = next_level_resource.instance()
	return next_level


func _load_current_level():
	var current_level = get_node("Level" + str(level))
	return current_level


func _spawn_clone():
	var new_clone = CLONE.instance()
	new_clone.set_z_index(1)
	new_clone.ORDER = previous_orders[level - 1]
	add_child(new_clone)


func go_to_next_level(first = false):
	started = false
	if not first:
		previous_orders.append(Globals.PLAYER.MT.new_order)
		left_over_time = round(TIMER.get_time_left())
		_spawn_clone()
		remove_child(_load_current_level())
		level += 1
		num_enemies = level
	add_child(_load_next_level())
	BATTERY_UI.reset()
	
	TIMER.set_paused(false)
	TIMER.stop()


func end_game():
	for child in get_children():
		if not child.name == "CanvasLayer":
			remove_child(child)
	
	TIMER_UI.set_visible(false)
	GAMEOVER_UI.text = "GAME OVER"
	GAMEOVER_UI.set_visible(true)


func no_more_time():
	end_game()
