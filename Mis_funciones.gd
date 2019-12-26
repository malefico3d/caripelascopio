extends Node

var ARRASTRA=false
var FOCO="none"
#func Mover():
	#self.rect_position = get_global_mouse_position()

#Inicializa valores de offset para los objetos
var OJO_DERECHO_OFFSET = Vector2(0.0, 0.0)
var OJO_IZQUIERDO_OFFSET = Vector2(0.0, 0.0)
var BOCA_OFFSET = Vector2(0.0, 0.0)
var NARIZ_OFFSET = Vector2(0.0, 0.0)