extends KinematicBody2D

export (int) var velocidad

var objetivo = Vector2()
var direccion = Vector2()

func _ready():
	$Cabello.texture = ExploradorArchivos.aspecto_jugador.cabello
	$Cuerpo.texture = ExploradorArchivos.aspecto_jugador.cuerpo
	$Sombrero.texture = ExploradorArchivos.aspecto_jugador.sombrero
	$Camisa.texture = ExploradorArchivos.aspecto_jugador.camisa

func _input(event):
	if event is InputEventMouseButton and event.is_pressed():
		set_physics_process(true)
		objetivo = get_global_mouse_position()
		
func _physics_process(_delta):
	direccion = position.direction_to(objetivo) * velocidad
	if position.distance_to(objetivo) > 5:
		direccion = move_and_slide(direccion)
