extends Node2D

# Declare member variables here. Examples:
var ojos_textura = 0
var caras_textura = 0
var bocas_textura = 0
# var b = "text"


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
	get_node("PanelContainer/Caras").connect("pressed", self, "_cambiar_textura_caras")
	get_node("PanelContainer/Ojos").connect("pressed", self, "_cambiar_textura_ojos")
	get_node("PanelContainer/Bocas").connect("pressed", self, "_cambiar_textura_bocas")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	pass
	
		
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

func _cambiar_textura_caras():
	print("Cambia textura de cara")
	get_node("PanelContainer/Caras/AnimationPlayer").play("slide")

func _cambiar_textura_ojos():
	print("Cambia textura de ojos")
	get_node("PanelContainer/Ojos/AnimationPlayer").play("slide")

func _cambiar_textura_bocas():
	print("Cambia textura de bocas")
	get_node("PanelContainer/Bocas/AnimationPlayer").play("slide")
	
	