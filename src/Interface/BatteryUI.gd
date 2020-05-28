extends Control

var battery_3_cell1 = load("res://assets/art/ui/battery 3 cell/battery 3 cell1.png")
var battery_3_cell2 = load("res://assets/art/ui/battery 3 cell/battery 3 cell2.png")
var battery_3_cell3 = load("res://assets/art/ui/battery 3 cell/battery 3 cell3.png")
var battery_3_cell4 = load("res://assets/art/ui/battery 3 cell/battery 3 cell4.png")
var battery_1_cell1 = load("res://assets/art/ui/battery 1 cell/battery 1 cell1.png")
var battery_1_cell2 = load("res://assets/art/ui/battery 1 cell/battery 1 cell2.png")

var charge
var max_charge
var num_1_cells = 0
var num_3_cells = 0


func reset():
	for i in get_children():
		i.set_texture(null)
	
	charge = 0
	max_charge = Globals.GAME.num_enemies
	
	num_3_cells = max_charge / 3
	num_1_cells = max_charge - num_3_cells * 3
	
	var current_battery = 1
	for _i in range(num_3_cells):
		get_node("Battery" + str(current_battery)).set_texture(battery_3_cell1)
		current_battery += 1
	
	for _i in range(num_1_cells):
		get_node("Battery" + str(current_battery)).set_texture(battery_1_cell1)
		current_battery += 1


func change_charge():
	var current_battery =  1
	var node
	var node_texture
	
	# Go through all the 3 cell batteries
	for i in num_3_cells:
		# Get node of current battery
		node = get_node("Battery" + str(current_battery))
		node_texture = node.get_texture()
		# Not 3/3
		if node_texture != battery_3_cell4:
			# 0/3
			if node_texture == battery_3_cell1:
				# Set to 1/3
				node.set_texture(battery_3_cell2)
			# 1/3
			elif node_texture == battery_3_cell2:
				# Set to 2/3
				node.set_texture(battery_3_cell3)
			# 2/3
			elif node_texture == battery_3_cell3:
				# Set to 3/3
				node.set_texture(battery_3_cell4)
			break
		# Is 3/3
		elif node_texture == battery_3_cell4:
			print(node.name + " is full")
		# Move to next battery
		current_battery += 1
	
	# Go through all the 1 cell batteries
	for i in num_1_cells:
		# Get node of current battery
		node = get_node("Battery" + str(current_battery))
		node_texture = node.get_texture()
		# Not 1/1
		if node_texture != battery_1_cell2:
			# Set to 1/1
			node.set_texture(battery_1_cell2)
			break
		# Is 1/1
		elif node_texture == battery_1_cell2:
			print(node.name + " is full")
		# Move to next battery
		current_battery += 1
