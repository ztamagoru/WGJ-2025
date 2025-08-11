extends Area2D

var player_in_deadzone = false

signal player_fell

func _physics_process(_delta):
	var bodies = get_overlapping_bodies()
	var player_found = false
	
	for body in bodies:
		if body.is_in_group("player"):
			player_found = true
			break
	
	if player_found and not player_in_deadzone:
		player_in_deadzone = true
		#print("Jugador entró en la deadzone")
		
		player_fell.emit()
	
	elif not player_found and player_in_deadzone:
		player_in_deadzone = false
