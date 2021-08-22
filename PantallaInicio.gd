extends Control


func _ready():
	pass

func _on_JuegoNuevo_pressed():
	get_tree().change_scene("res://Prueba.tscn")

func _on_CargarPartida_pressed():
	ExploradorArchivos.cargar_juego()
	get_tree().change_scene("res://EscenarioPrueba.tscn")
