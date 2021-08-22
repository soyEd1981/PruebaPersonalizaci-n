extends Control
class_name SelectorImagen

signal imagen_cambiada(textura)

var imagenes: = []
var indice: = 0 setget establecer_indice

onready var imagen: Sprite = Sprite.new()

func _ready():
	imagen.scale.x = 10
	imagen.scale.y = 10
	imagen.hframes = 16
	imagen.vframes = 4
	add_child(imagen)
	imagen.position.x = 80

func establecimiento(texturas_imagenes: Array):
	imagenes = texturas_imagenes

func establecer_indice(valor: int):
	indice = wrapi(valor, 0, imagenes.size())
	var textura: StreamTexture = imagenes[indice]
	imagen.texture = textura
	emit_signal("imagen_cambiada", textura)

func _on_Anterior_pressed():
	establecer_indice(indice - 1)

func _on_Posterior_pressed():
	establecer_indice(indice + 1)


