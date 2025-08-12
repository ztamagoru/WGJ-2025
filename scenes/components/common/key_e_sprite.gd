extends Sprite2D

var distance_from_player : int = 50

func _process(_delta):
	follow_player()

func follow_player():
	if is_instance_valid(Globals.player):
		global_position.x = Globals.player.global_position.x
		global_position.y = Globals.player.global_position.y - distance_from_player
