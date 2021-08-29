extends Resource
class_name EstadisticasJugador

signal energia_terminada

export (int) var vitalidad
export (int) var fuerza
export (int) var agilidad
export (int) var destreza
export (int) var resistencia

export (int) var energia

func _ready():
	pass

func cansancio():
	emit_signal("energia_terminada")
