extends StateMachine


func _ready():
	call_deferred("set_state", States.WAIT)


func _input(event):
	pass


func _state_logic(delta):
	pass


func _get_transition():
	match state:
		# In WAIT
		States.WAIT:
			pass
		# In IDLE
		States.IDLE:
			pass
		# In RUN
		States.RUN:
			pass
		# In JUMP
		States.JUMP:
			pass
		# In FALL
		States.FALL:
			pass
		# In ATK_LIGHT
		States.ATK_LIGHT:
			pass
		# In ATK_HEAVY
		States.ATK_HEAVY:
			pass
		# In LAUNCH
		States.LAUNCH:
			pass
	return null


func _enter_state(new_state, _old_state):
	match new_state:
		States.WAIT:
			pass
		States.IDLE:
			pass
		States.RUN:
			pass
		States.JUMP:
			pass
		States.FALL:
			pass
		States.ATK_LIGHT:
			pass
		States.ATK_HEAVY:
			pass
		States.LAUNCH:
			pass
