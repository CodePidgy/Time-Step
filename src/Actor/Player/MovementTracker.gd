extends Node


var frame = 0
var new_order = []


func _physics_process(_delta):
	if Globals.PLAYER.SM.state != Globals.PLAYER.SM.States.WAIT:
		frame += 1
		
		var player = get_parent()
		var player_state = player.SM.state
		var player_position = player.position
		
		new_order.append([player_state, player_position])
