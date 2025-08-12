extends Area2D

var text_key : String

var area_active = false

var interaction_show_scene = preload("res://scenes/components/common/key_e_sprite.tscn")

func _process(_delta):
	text_key = Globals.witch_text_state

func _input(event):
	if area_active and event.is_action_pressed("dialog"):
		Globals.emit_signal("display_dialog", text_key)

func _on_area_entered(_area):
	var interaction_show = interaction_show_scene.instantiate()
	
	get_tree().current_scene.add_child(interaction_show)
	
	area_active = true

func _on_area_exited(_area):
	var interaction_sprite = get_tree().current_scene.get_node("KeyESprite")
	
	if interaction_sprite and is_instance_valid(interaction_sprite):
		interaction_sprite.queue_free()
	
	area_active = false
