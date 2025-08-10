extends Node2D

func _ready():
	Globals.player.camera.limit_top = 0
	Globals.player.camera.limit_bottom = 1080
	Globals.player.camera.limit_left = 0
	Globals.player.camera.limit_right = 1920
	
	#Globals.player.camera.zoom = Vector2(0.75,0.75)
