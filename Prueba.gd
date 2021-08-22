extends Control

var IMAGENES: Dictionary = {
	'cuerpo': ExploradorArchivos.obtener_archivos("res://Assets/Minifantasy_AMyriadOfNPCs_v.1.0/Minifantasy_NPCs_Assets/Generic_NPCs/Idle/_Characters/Human/"),
	'cabello': ExploradorArchivos.obtener_archivos("res://Assets/Minifantasy_AMyriadOfNPCs_v.1.0/Minifantasy_NPCs_Assets/Generic_NPCs/Idle/Head/Hairstyles/"),
	'sombrero': ExploradorArchivos.obtener_archivos("res://Assets/Minifantasy_AMyriadOfNPCs_v.1.0/Minifantasy_NPCs_Assets/Generic_NPCs/Idle/Head/Hats/"),
	'camisa': ExploradorArchivos.obtener_archivos("res://Assets/Minifantasy_AMyriadOfNPCs_v.1.0/Minifantasy_NPCs_Assets/Generic_NPCs/Idle/Body/Blouses,Doublets,Shirts/")}

var cuerpo_actual: int = 0
var cabello_actual: int = 0
var sombrero_actual: int = 0
var camisa_actual: int = 0

func _ready():
	$CenterContainer/PersonajeBase/Cuerpo.texture = IMAGENES['cuerpo'][cuerpo_actual]
	$CenterContainer/PersonajeBase/Cabello.texture = IMAGENES['cabello'][cabello_actual]
	$CenterContainer/PersonajeBase/Sombrero.texture = IMAGENES['sombrero'][sombrero_actual]
	$CenterContainer/PersonajeBase/Camisa.texture = IMAGENES['camisa'][camisa_actual]

func _physics_process(delta):
	$CenterContainer/PersonajeBase.set_physics_process(false)

func _on_Cabello_pressed():
	cabello_actual = (cabello_actual + 1) % IMAGENES['cabello'].size()
	$CenterContainer/PersonajeBase/Cabello.texture = IMAGENES['cabello'][cabello_actual]
	ExploradorArchivos.guardar_cabello_jugador(IMAGENES['cabello'][cabello_actual])

func _on_Cuerpo_pressed():
	cuerpo_actual = (cuerpo_actual + 1) % IMAGENES['cuerpo'].size()
	$CenterContainer/PersonajeBase/Cuerpo.texture = IMAGENES['cuerpo'][cuerpo_actual]
	ExploradorArchivos.guardar_cuerpo_jugador(IMAGENES['cuerpo'][cuerpo_actual])

func _on_Sombrero_pressed():
	sombrero_actual = (sombrero_actual + 1) % IMAGENES['sombrero'].size()
	$CenterContainer/PersonajeBase/Sombrero.texture = IMAGENES['sombrero'][sombrero_actual]
	ExploradorArchivos.guardar_sombrero_jugador(IMAGENES['sombrero'][sombrero_actual])

func _on_Camisa_pressed():
	camisa_actual =(camisa_actual + 1) % IMAGENES['camisa'].size()
	$CenterContainer/PersonajeBase/Camisa.texture = IMAGENES['camisa'][camisa_actual]
	ExploradorArchivos.guardar_camisa_jugador(IMAGENES['camisa'][camisa_actual])
	
func _on_Inicio_pressed():
	ExploradorArchivos.salvar_juego()
	get_tree().change_scene("res://EscenarioPrueba.tscn")

	
	
	
	




