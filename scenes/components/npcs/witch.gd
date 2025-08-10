extends CharacterBody2D

@export var animation : AnimatedSprite2D

func _ready():
	animation.play("anim_Idle")

func _process(_delta):
	pass
