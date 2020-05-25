extends StateMachine


func _ready():
	call_deferred("set_state", States.WAIT)


func _input(event):
	if state == States.IDLE or state == States.RUN:
		if event.is_action_pressed("jump"):
			state = States.JUMP
			parent.velocity.y = -parent.JUMP_VELOCITY


func _state_logic(delta):
	if state != States.WAIT:
		parent.apply_gravity(delta)
		parent.handle_move_input()
		parent.apply_movement()


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
			parent.ANIMATION_PLAYER.play("wait")
		States.IDLE:
			parent.ANIMATION_PLAYER.play("idle")
		States.RUN:
			parent.ANIMATION_PLAYER.play("run")
		States.JUMP:
			parent.ANIMATION_PLAYER.play("jump")
		States.FALL:
			parent.ANIMATION_PLAYER.play("fall")
		States.ATK_LIGHT:
			parent.ANIMATION_PLAYER.play("atk_light")
		States.ATK_HEAVY:
			parent.ANIMATION_PLAYER.play("atk_heavy")
		States.LAUNCH:
			parent.ANIMATION_PLAYER.play("launch")
