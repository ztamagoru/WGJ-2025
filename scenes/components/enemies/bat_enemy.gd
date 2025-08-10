extends Enemy

@export var hitbox : Area2D
@export var timer : Timer

@export_enum("Horizontal", "Vertical") var move_axis : String = "Horizontal"

var position_start : Vector2
var distance_limit : int = 50
var enemy_speed : float = 5000.0

var direction : Vector2

func _ready():
	animation.play("anim_Flying")
	position_start = global_position
	
	if move_axis == "Horizontal":
		direction = Vector2(1, 0)
	elif move_axis == "Vertical":
		direction = Vector2(0, 1)

func _physics_process(delta):
	movement(delta)

func movement(delta):
	velocity = direction * enemy_speed * delta
	
	if position.distance_to(position_start) >= distance_limit:
		direction = position.direction_to(position_start).normalized()
	
	move_and_slide()

func _on_timer_timeout() -> void:
	for body in hitbox.get_overlapping_bodies():
		if body.is_in_group("player"):
			body.take_damage(10)
			print("damage")
