extends Node2D

@export var animation : AnimatedSprite2D

func _ready():
	animation.play("default")
