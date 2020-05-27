extends Area2D


onready var PISTON = $Piston
onready var TWEEN = $Piston/Tween
onready var LAUNCH_SOUND = $Launch

export var LAUNCH_SPEED = 2

var activated = false


func launch(body):
	if body.name == "Player" and not activated:
		LAUNCH_SOUND.play()
		TWEEN.interpolate_property(PISTON, "position", PISTON.position, PISTON.position - Vector2(0, 5), 1.0/LAUNCH_SPEED, Tween.TRANS_ELASTIC, Tween.EASE_OUT)
		TWEEN.start()
		
		Globals.PLAYER.SM.set_state(Globals.PLAYER.SM.States.LAUNCH)
		
		Globals.GAME.TIMER.set_paused(true)
		Globals.GAME.SWITCHLEVEL_TIMER.start()
