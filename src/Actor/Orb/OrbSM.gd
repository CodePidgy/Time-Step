extends StateMachine


enum States {WAIT, IDLE}


func _ready():
	call_deferred("set_state", States.WAIT)
	parent.position = parent.ORDER[0][1]


func _state_logic(_delta):
	match state:
		# In WAIT
		States.WAIT:
			# Player not in WAIT
			if Globals.PLAYER.SM.state != States.WAIT:
				if parent.TIMER.get_time_left() == 0:
					parent.TIMER.start()
		# In IDLE
		States.IDLE:
			if Globals.PLAYER.SM.state == States.WAIT:
				parent.reset()
				set_state(States.WAIT)
			elif Globals.PLAYER.SM.state != States.WAIT:
				parent.order()


func _enter_state(new_state, _old_state):
	match new_state:
		States.WAIT:
			parent.ANIMATION_PLAYER.play("wait")
		States.IDLE:
			parent.ANIMATION_PLAYER.play("idle")
