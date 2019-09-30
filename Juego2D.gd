extends Node2D

# Declare member variables here. Examples:
var ojos_textura_1 = preload("res://Discos/Ojos_disco1.png")
var ojos_textura_2 = preload("res://Discos/Ojos_disco2.png")
var ojos_textura_3 = preload("res://Discos/Ojos_disco3.png")
var cara_textura_1 = preload("res://Discos/Caras_disco1.png")
var cara_textura_2 = preload("res://Discos/Caras_disco2.png")
var cara_textura_3 = preload("res://Discos/Caras_disco3.png")
var boca_textura_1 = preload("res://Discos/Bocas_disco1.png")
var boca_textura_2 = preload("res://Discos/Bocas_disco2.png")
var boca_textura_3 = preload("res://Discos/Bocas_disco3.png")

var bocas_textura = ""
var C= 0
var O= 0
var B= 0
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
	get_node("Panel/Caras_TexButton").connect("pressed", self, "_on_cara_textura_pressed")
	get_node("Panel/Ojos_TexButton").connect("pressed", self, "_on_ojos_textura_pressed")
	get_node("Panel/Bocas_TexButton").connect("pressed", self, "_on_bocas_textura_pressed")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#pass
	#print(ojos_textura)
	#print(caras_textura)
	#print(bocas_textura)
	print("----")
	
		
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

func _on_cara_textura_pressed():
	get_node("Panel/Caras_TexButton/AnimationPlayer").play("slide")
	_cambiar_textura_caras()
	#print(caras_textura)
	C+=1
	if C>2:
		C=0
func _on_ojos_textura_pressed():
	print("Cambia textura de ojos")
	get_node("Panel/Ojos_TexButton/AnimationPlayer").play("slide")
	_cambiar_textura_ojos()
	O+=1
	if O>2:
		O=0
func _on_bocas_textura_pressed():
	print("Cambia textura de bocas")
	get_node("Panel/Bocas_TexButton/AnimationPlayer").play("slide")
	_cambiar_textura_bocas()
	B+=1
	if B>2:
		B=0

func _cambiar_textura_caras():
	print("Cambia textura de cara")
	match C:
		0:
			#caras_textura="res:/Discos/Caras_disco1.png"
			get_node("Cara/cara_mask/AniCara/Caras").set_texture(cara_textura_1)
		1:
			get_node("Cara/cara_mask/AniCara/Caras").set_texture(cara_textura_2)
		2:
			get_node("Cara/cara_mask/AniCara/Caras").set_texture(cara_textura_3)

func _cambiar_textura_ojos():
	print("Cambia textura de ojos")
	match O:
		0:
			#caras_textura="res:/Discos/Caras_disco1.png"
			get_node("Cara/Ojos_mask-derecha/AniGiroOjo/Ojos-derecha").set_texture(ojos_textura_1)
			get_node("Cara/Ojos_mask-izquierda/AniGiroOjo2/Ojos-izquierda").set_texture(ojos_textura_1)
		1:
			get_node("Cara/Ojos_mask-derecha/AniGiroOjo/Ojos-derecha").set_texture(ojos_textura_2)
			get_node("Cara/Ojos_mask-izquierda/AniGiroOjo2/Ojos-izquierda").set_texture(ojos_textura_2)
		2:
			get_node("Cara/Ojos_mask-derecha/AniGiroOjo/Ojos-derecha").set_texture(ojos_textura_3)
			get_node("Cara/Ojos_mask-izquierda/AniGiroOjo2/Ojos-izquierda").set_texture(ojos_textura_3)

func _cambiar_textura_bocas():
	print("Cambia textura de cara")
	match B:
		0:
			#caras_textura="res:/Discos/Caras_disco1.png"
			get_node("Cara/boca_mask/AniBoca/Bocas").set_texture(cara_textura_1)
		1:
			get_node("Cara/boca_mask/AniBoca/Bocas").set_texture(cara_textura_2)
		2:
			get_node("Cara/boca_mask/AniBoca/Bocas").set_texture(cara_textura_3)
	

	
	