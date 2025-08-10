extends Area2D

#@export 
var text_key : String

var area_active = false

func _process(_delta):
	text_key = Globals.witch_text_state

func _input(event):
	if area_active and event.is_action_pressed("dialog"):
		Globals.emit_signal("display_dialog", text_key)

func _on_area_entered(_area: Area2D) -> void:
	area_active = true # Replace with function body.

func _on_area_exited(_area: Area2D) -> void:
	area_active = false # Replace with function body.
