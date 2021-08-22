extends Node

var aspecto_jugador: Resource = preload("res://AtributosJugador.tres")

func _ready():
	pass

func obtener_archivos(carpeta):
	var archivos_recolectados = {}
	var conteo_archivos = 0
	var directorio = Directory.new()
	
	directorio.open(carpeta)
	directorio.list_dir_begin()
	
	while true:
		var archivo = directorio.get_next()
		if archivo == "":
			break
		elif not archivo.begins_with(".") and not archivo.ends_with('import'):
			archivos_recolectados[conteo_archivos] = carpeta + archivo
			conteo_archivos += 1
	var lista_archivos: Array = []
	for a in archivos_recolectados.values():
		lista_archivos.append(load(a))
	
	return lista_archivos
	#return archivos_recolectados
	
func guardar_cuerpo_jugador(elemento_seleccionado):
	aspecto_jugador.cuerpo = elemento_seleccionado
	
func guardar_cabello_jugador(elemento_seleccionado):
	aspecto_jugador.cabello = elemento_seleccionado
	
func guardar_sombrero_jugador(elemento_seleccionado):
	aspecto_jugador.sombrero = elemento_seleccionado
	
func guardar_camisa_jugador(elemento_seleccionado):
	aspecto_jugador.camisa = elemento_seleccionado

func salvar_juego():
	var directorio = Directory.new()
	if not directorio.dir_exists('user://salvados'):
		directorio.make_dir_recursive('user://salvados')
	ResourceSaver.save('user://salvados/juego_salvado.tres', aspecto_jugador)

func cargar_juego():
	var directorio = Directory.new()
	if not directorio.file_exists('user://salvados/juego_salvado.tres'):
		return false
		
	var juego_cargado = load('user://salvados/juego_salvado.tres')
	aspecto_jugador.cuerpo = juego_cargado.cuerpo
	aspecto_jugador.camisa = juego_cargado.camisa
	aspecto_jugador.cabello = juego_cargado.cabello
	aspecto_jugador.sombrero = juego_cargado.sombrero

#func salvar_juego():
#	var juego_salvado = estadisticas.new()
#	juego_salvado.posicion_jugador = $Jugador.position
#	juego_salvado.estamina = $Jugador.estamina
#	var directorio = Directory.new()
#	if not directorio.dir_exists('user://salvados'):
#		directorio.make_dir_recursive('user://salvados')
#	ResourceSaver.save('user://salvados/juego_salvado.tres', juego_salvado)
#
#func cargar_juego():
#	var directorio = Directory.new()
#	if not directorio.file_exists('user://salvados/juego_salvado.tres'):
#		return false
#
#	var juego_cargado = load('user://salvados/juego_salvado.tres')
#	$Jugador.position = juego_cargado.posicion_jugador
#	$Jugador.estamina = juego_cargado.estamina

















