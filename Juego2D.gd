extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var rotacion_step = 0.0
var Anim ="none"

#var ojos_L = "Cara/Ojos_mask-izquierda/Ojos-izquierda"
#var ojos_R = "Cara/Ojos_mask-derecha/Ojos-derecha"
#var boca = "Cara/boca_mask/Bocas"
#var cara = "Cara/cara_mask/Caras"

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Rotar-ojo-derecho").connect("pressed", self,"_on_ojo_derecho_pressed")
	get_node("Rotar-ojo-izquierdo").connect("pressed", self,"_on_ojo_izquierdo_pressed")
	get_node("Rotar-boca").connect("pressed", self, "_on_boca_pressed")
	get_node("Rotar-cara").connect("pressed", self, "_on_cara_pressed")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	pass
	print("Cambio")
	
		
func _on_ojo_derecho_pressed():
	get_node("Cara/Ojos_mask-derecha/AniGiroOjo").play("Rotacion")
	
func _on_ojo_izquierdo_pressed():
	get_node("Cara/Ojos_mask-izquierda/AniGiroOjo2").play("Rotacion")

func _on_boca_pressed():
	print("boca")
	get_node("Cara/boca_mask/AniBoca").play("Rotacion")

func _on_cara_pressed():
	print("cara")
	get_node("Cara/cara_mask/AniCara").play("RotacionCara")