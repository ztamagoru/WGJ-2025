extends RigidBody2D

@export var push_speed : float
@export var player_detection : Area2D

var pushing_direction := 0

func _ready():
	player_detection.body_entered.connect(_on_body_entered)
	player_detection.body_exited.connect(_on_body_exited)

func _physics_process(delta):
	if pushing_direction != 0:
		linear_velocity.x = pushing_direction * push_speed * delta

func _on_body_entered(body):
	if body.is_in_group("player"):
		print("Jugador entró en área, velocidad X:", body.velocity.x)
		var dir = sign(body.velocity.x)
		pushing_direction = dir

func _on_body_exited(body):
	if body.is_in_group("player"):
		print("Jugador salió del área")
		pushing_direction = 0
