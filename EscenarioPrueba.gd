extends Node2D

export (PackedScene) var personaje: PackedScene
onready var jugador = personaje.instance()

func _ready():
	add_child(jugador)
	pass
	
