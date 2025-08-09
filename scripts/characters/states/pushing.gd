extends State

func enter():
	sprite.play("anim_" + name)
	print("pushing")

func physics_update(delta):
	if not player.is_on_floor():
		get_parent().change_state("Falling")
		return
	
	var direction = Input.get_axis("move_left", "move_right")
	player.velocity.x = direction * player.speed * delta
	
	player.move_and_slide()
	
	if player.velocity.x == 0:
		get_parent().change_state("Idle")
		return
	
	var is_pushing : bool = false
	
	for i in range(player.get_slide_collision_count()):
		var collision = player.get_slide_collision(i)
		
		if collision.get_collider() is RigidBody2D:
			is_pushing = true
			break
	
	if not is_pushing:
		get_parent().change_state("Running")

func exit():
	sprite.stop()
