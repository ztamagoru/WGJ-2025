extends Control

var potions : int

@export var potions_text : Label

func _process(_delta):
	potions_text.text = str(potions)
