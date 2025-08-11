extends Node2D

@export var start_position : Marker2D
@export var fallzone : Area2D

var player_start_position : Vector2
var last_safe_position : Vector2

func _ready():
	Globals.witch_text_state = "witch1"
	
	Globals.player.camera.offset = Vector2(0.0,-100.0)
	
	Globals.player.camera.limit_top = 100
	Globals.player.camera.limit_bottom = 1180
	Globals.player.camera.limit_left = 0
	Globals.player.camera.limit_right = 1920
	
	#Globals.player.camera.zoom = Vector2(0.75,0.75)
	
	player_start_position = start_position.global_position
	fallzone.player_fell.connect(respawn_player)
	
	Globals.player.global_position = player_start_position

func update_safe_position(current_position):
	if is_instance_valid(Globals.player):
		last_safe_position = current_position

func respawn_player():
	if is_instance_valid(Globals.player):
		Globals.player.global_position = last_safe_position
		
		if "velocity" in Globals.player:
			Globals.player.velocity = Vector2.ZERO
