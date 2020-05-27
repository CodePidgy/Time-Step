extends StateMachine


enum States {WAIT, IDLE, RUN}


func _ready():
	call_deferred("set_state", States.WAIT)


func _state_logic(delta):
	match state:
		# In WAIT
		States.WAIT:
			pass
		# In IDLE
		States.IDLE:
			parent.apply_gravity(delta)
			parent.apply_movement()
		# In RUN
		States.RUN:
			parent.handle_collisions()
			parent.apply_gravity(delta)
			parent.apply_movement()


func _get_transition():
	match state:
		# In WAIT
		States.WAIT:
			# Player not in WAIT
			if Globals.PLAYER.SM.state != States.WAIT:
				return parent.DESIRED_STATE


func _enter_state(new_state, _old_state):
	match new_state:
		States.WAIT:
			parent.ANIMATION_PLAYER.play("wait")
		States.IDLE:
			parent.ANIMATION_PLAYER.play("idle")
		States.RUN:
			parent.ANIMATION_PLAYER.play("run")
