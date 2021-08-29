extends Area2D

var talado = false

func _ready():
	pass

func _on_RecursoMadera_body_entered(body):
	if body.name == 'Jugador':
		body.puede_interactuar = true
		talado = true

func _on_RecursoMadera_body_exited(body):
	if body.name == 'Jugador':
		body.puede_interactuar = false
		talado = false

func anim_talando():
	$AnimationPlayer.play("talando")

func _on_RecursoMadera_input_event(viewport, event, shape_idx):
	if event is InputEventScreenTouch and event.is_pressed() and talado:
		PruebaGlobal.jugador.talando()
		anim_talando()
