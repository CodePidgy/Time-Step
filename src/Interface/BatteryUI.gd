extends Control

var battery_3_cell = load("res://assets/art/ui/battery 3 cell/battery 3 cell1.png")
var battery_1_cell = load("res://assets/art/ui/battery 1 cell/battery 1 cell1.png")

var charge = 0
var max_charge = 0
var num_1_cells = 0
var num_3_cells = 0


func reset():
	for i in get_children():
		i.set_texture(null)
	
	max_charge = Globals.GAME.num_enemies
	
	num_3_cells = max_charge / 3
	num_1_cells = max_charge - num_3_cells * 3
	
	var current_battery = 1
	for _i in range(num_3_cells):
		get_node("Battery" + str(current_battery)).set_texture(battery_3_cell)
		current_battery += 1
	
	for _i in range(num_1_cells):
		get_node("Battery" + str(current_battery)).set_texture(battery_1_cell)
		current_battery += 1
