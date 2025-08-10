extends CharacterBody2D
class_name Enemy

@export var hp : int
@export var animation : AnimatedSprite2D

func take_damage(damage : int):
	hp -= damage
	
	if hp <= 0:
		die()
	
	blink()

func blink():
	self.modulate.a = 0
	await get_tree().create_timer(0.1).timeout
	self.modulate.a = 100
	await get_tree().create_timer(0.1).timeout

func _process(_delta):
	sprite_flip()

func sprite_flip():
	if velocity.x < 0:
		animation.flip_h = false
	elif velocity.x > 0:
		animation.flip_h = true

func die():
	queue_free()
