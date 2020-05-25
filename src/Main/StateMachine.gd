class_name StateMachine
extends Node


enum States {WAIT, IDLE, RUN, JUMP, FALL, ATK_LIGHT, ATK_HEAVY, LAUNCH}

onready var parent = get_parent()

var state = null setget set_state
var previous_state = null


func _physics_process(delta):
	if state != null:
		_state_logic(delta)
		var transition = _get_transition()
		if transition != null:
			set_state(transition)


func _state_logic(_delta):
	pass


func _get_transition():
	return null


func _enter_state(_new_state, _old_state):
	pass


func _exit_state(_old_state, _new_state):
	pass


func set_state(new_state):
	previous_state = state
	state = new_state
	
	if previous_state != null:
		_exit_state(previous_state, new_state)
	if new_state != null:
		_enter_state(new_state, previous_state)
