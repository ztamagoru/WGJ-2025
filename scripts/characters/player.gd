extends CharacterBody2D

@export var speed : float
@export var gravity : float
@export var jump_force : float 

#@export var hud : Control

@export var camera : Camera2D

func _ready():
	#Globals.player = self
	
	await get_tree().process_frame
	
	#no sé  si va a tener stats que se vayan a cargar
	#a la hora de iniciar de vuelta la partida

func _physics_process(_delta):
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().quit()
		
		#de momento cierra el juego,
		#pero luego podría abrirse un menu de pausa
