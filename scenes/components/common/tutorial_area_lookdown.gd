extends Area2D

var player_enter : bool = false
var tutorial_shown : bool = false

var look_down_tutorial_scene = preload("res://scenes/components/ui/hud/controls_look_down.tscn")

func _physics_process(_delta):
	var bodies = get_overlapping_bodies()
	
	for body in bodies:
		if body.is_in_group("player"):
			player_enter = true

func _process(_delta):
	if player_enter and not tutorial_shown:
		show_tutorial()

func show_tutorial():
	tutorial_shown = true
	
	var canvas_layer = get_tree().current_scene.get_node("ControlsMovement")
	
	if canvas_layer and is_instance_valid(canvas_layer):
		canvas_layer.queue_free()
	
	var look_down_tutorial = look_down_tutorial_scene.instantiate()
	get_tree().current_scene.add_child(look_down_tutorial)
	
	queue_free()
