extends KinematicBody2D


onready var SM = $StateMachine
onready var TIMER = $Timer
onready var ANIMATION_PLAYER = $AnimationPlayer

var frame = 0
var ORDER


func order():
	position = ORDER[frame][1]
	
	if frame < len(ORDER) - 1:
		frame += 1


func reset():
	frame = 0
	position = ORDER[frame][1]


func start():
	SM.state = SM.States.IDLE
