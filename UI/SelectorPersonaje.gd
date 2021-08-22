extends Control

signal cuerpo_cambiado(textura)
signal cabello_cambiado(textura)

var DATOS: Dictionary = {
	'cuerpo': ExploradorArchivos.obtener_archivos("res://Assets/Minifantasy_AMyriadOfNPCs_v.1.0/Minifantasy_NPCs_Assets/Generic_NPCs/Idle/_Characters/Human/"),
	'cabello': ExploradorArchivos.obtener_archivos("res://Assets/Minifantasy_AMyriadOfNPCs_v.1.0/Minifantasy_NPCs_Assets/Generic_NPCs/Idle/Head/Hairstyles/")
}

const SELECTOR_IMAGEN: PackedScene = preload("res://UI/SelectorImagen.tscn")

onready var contenedor: VBoxContainer = $Panel/VBoxContainer

func _ready():
	for d in DATOS:
		var texturas: Array = DATOS[d]
		var selector_imagen: SelectorImagen = SELECTOR_IMAGEN.instance()
		contenedor.add_child(selector_imagen)
		selector_imagen.establecimiento(texturas)
		selector_imagen.connect("imagen_cambiada", self, "_on_selector_imagen_imagen_cambiada", [d])

func _on_selector_imagen_imagen_cambiada(textura: StreamTexture, clave: String):
	emit_signal(clave + '_cambiado', textura)

#func _ready():
#	$Cuerpo.texture = load(DATOS['cuerpo'][indice])
#	$Cabello.texture = load(DATOS.cabello[indice])
#	print(DATOS.cabello.size())
#
#func _on_SeleccionCuerpo_pressed():
#	if indice < DATOS['cuerpo'].size() - 1:
#		indice += 1
#		$Cabello.texture = load(DATOS.cuerpo[indice])
#	else:
#		indice = 0
#	return DATOS['cuerpo'][indice]
#
#func _on_SeleccionCabello_pressed():
#	if indice < DATOS['cabello'].size() - 1:
#		indice += 1
#		$Cabello.texture = load(DATOS.cabello[indice])
#	else:
#		indice = 0












