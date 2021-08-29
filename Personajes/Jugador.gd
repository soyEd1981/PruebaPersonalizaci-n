extends KinematicBody2D

export (int) var velocidad = 100
var objetivo = Vector2()
var direccion = Vector2()

var puede_moverse = true
var puede_interactuar = false

export (Resource) var estadisticas

enum ESTADOS {MOVIENDO, TALANDO}
var estado = ESTADOS.MOVIENDO

func _ready():
	PruebaGlobal.jugador = self
	
	estadisticas.connect('energia_terminada', self, '_on_energia_terminada')
	pass

func _input(event):
	var obj = $RayCast2D.get_collider()
	if event is InputEventScreenDrag or (InputEventScreenTouch and event.is_pressed()):
		objetivo = get_global_mouse_position()
	if event is InputEventScreenTouch and event.is_pressed() and puede_interactuar and $RayCast2D.is_colliding():
#		estadisticas.energia -= 1
#		print(estadisticas.energia)
#		if estadisticas.energia == 0:
#			estadisticas.cansancio()
		if obj != null:
			if obj.is_in_group('recurso'):
				print('algo')
				obj.anim_talando()
				estado = ESTADOS.TALANDO

func _process(delta):
	pass

func _physics_process(delta):
	match estado:
		ESTADOS.MOVIENDO:
			movimiento()
		ESTADOS.TALANDO:
			talando()

func _on_energia_terminada():
	puede_moverse = false

func movimiento():
	direccion = position.direction_to(objetivo) * velocidad
	if position.distance_to(objetivo) > 5 and puede_moverse:
		direccion = move_and_slide(direccion)
		$AnimationTree.set('parameters/inmovil/blend_position', direccion)
		$AnimationTree.set('parameters/caminando/blend_position', direccion)
		$AnimationTree.set('parameters/talando/blend_position', direccion)
		$AnimationTree.get('parameters/playback').travel('caminando')
	else:
		$AnimationTree.get('parameters/playback').travel('inmovil')
	
#	if direccion.length() == 0:
#		$AnimationTree.get('parameters/playback').travel('inmovil')
#	else:
#		$AnimationTree.set('parameters/inmovil/blend_position', direccion)
#		$AnimationTree.set('parameters/caminando/blend_position', direccion)
#		$AnimationTree.get('parameters/playback').travel('caminando')
	
	if direccion != Vector2.ZERO:
		$RayCast2D.cast_to = direccion.normalized() * 5

func talando():
	direccion = Vector2.ZERO
	$AnimationTree.get('parameters/playback').travel('talando')
	estado = ESTADOS.TALANDO
	print('Estoy talando')

func animacion_talado_concluida():
	estado = ESTADOS.MOVIENDO





























