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
var nariz_textura_1 = preload("res://Discos/Nariz_disco1.png")
var nariz_textura_2 = preload("res://Discos/Nariz_disco2.png")
var nariz_textura_3 = preload("res://Discos/Nariz_disco3.png")

var C= 1
var O= 1
var B= 1
var N= 1


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("OJO_R").connect("pressed", self,"_on_ojo_derecho_pressed")
	get_node("OJO_L").connect("pressed", self,"_on_ojo_izquierdo_pressed")
	get_node("BOCA").connect("pressed", self, "_on_boca_pressed")
	get_node("CARA").connect("pressed", self, "_on_cara_pressed")
	get_node("NARIZ").connect("pressed", self, "_on_nariz_pressed")
	get_node("Caras_TexButton").connect("pressed", self, "_on_cara_textura_pressed")
	get_node("Ojos_TexButton").connect("pressed", self, "_on_ojos_textura_pressed")
	get_node("Bocas_TexButton").connect("pressed", self, "_on_bocas_textura_pressed")
	get_node("Nariz_TexButton").connect("pressed", self, "_on_nariz_textura_pressed")

		
func _on_ojo_derecho_pressed():
	var ojo_R=get_node("OJO_R")
	Mis_funciones.OJO_DERECHO_OFFSET =  get_global_mouse_position() - ojo_R.rect_position
	get_node("OJO_R/Ojos_mask-derecha/Ojo-derecho/AniGiroOjo").play("Rotacion")
	
func _on_ojo_izquierdo_pressed():
	var ojo_L = get_node("OJO_L")
	Mis_funciones.OJO_IZQUIERDO_OFFSET = get_global_mouse_position() - ojo_L.rect_position
	get_node("OJO_L/Ojos_mask-izquierda/Ojos-izquierda/AniGiroOjo2").play("Rotacion")

func _on_boca_pressed():
	var boca = get_node("BOCA")
	Mis_funciones.BOCA_OFFSET = get_global_mouse_position() - boca.rect_position
	print("boca")
	get_node("BOCA/boca_mask/Bocas/AniBoca").play("Rotacion")

func _on_cara_pressed():
	print("cara")
	get_node("CARA/cara_mask/Caras/AniCara").play("RotacionCara")

func _on_nariz_pressed():
	var nariz = get_node("NARIZ")
	Mis_funciones.NARIZ_OFFSET = get_global_mouse_position() - nariz.rect_position
	print("nariz")
	get_node("NARIZ/Nariz/Nariz/AniGiroNariz").play("Giro")
	
func _on_cara_textura_pressed():
	get_node("Caras_TexButton/AnimationPlayer").play("slide")
	_cambiar_textura_caras()
	#print(caras_textura)
	C+=1
	if C>2:
		C=0
func _on_ojos_textura_pressed():
	get_node("Ojos_TexButton/AnimationPlayer").play("slide")
	_cambiar_textura_ojos()
	O+=1
	if O>2:
		O=0
func _on_bocas_textura_pressed():
	print("Cambia textura de bocas")
	get_node("Bocas_TexButton/AnimationPlayer").play("slide")
	_cambiar_textura_bocas()
	B+=1
	if B>2:
		B=0

func _on_nariz_textura_pressed():
	print("Cambia textura de bocas")
	get_node("Nariz_TexButton/AnimationPlayer").play("slide")
	_cambiar_textura_nariz()
	N+=1
	if N>2:
		N=0
		
func _cambiar_textura_caras():
	print("Cambia textura de cara")
	match C:
		0:
			get_node("CARA/cara_mask/Caras").set_texture(cara_textura_1)
		1:
			get_node("CARA/cara_mask/Caras").set_texture(cara_textura_2)
		2:
			get_node("CARA/cara_mask/Caras").set_texture(cara_textura_3)

func _cambiar_textura_ojos():
	print("Cambia textura de ojos")
	print("Set para ojos es:", O)
	match O:
		0:
			#get_node("Cara/Ojos_mask-derecha/AniGiroOjo/Ojos-derecha").set_texture(ojos_textura_1)
			get_node("OJO_R/Ojos_mask-derecha/Ojo-derecho").set_texture(ojos_textura_1)
			#get_node("Cara/Ojos_mask-derecha/AniGiroOjo/Ojo-derecho").update()
			get_node("OJO_L/Ojos_mask-izquierda/Ojos-izquierda").set_texture(ojos_textura_1)
		1:
			#get_node("Cara/Ojos_mask-derecha/AniGiroOjo/Ojos-derecha").set_texture(ojos_textura_2)
			get_node("OJO_R/Ojos_mask-derecha/Ojo-derecho").set_texture(ojos_textura_2)
			get_node("OJO_L/Ojos_mask-izquierda/Ojos-izquierda").set_texture(ojos_textura_2)
		2:
			#get_node("Cara/Ojos_mask-derecha/AniGiroOjo/Ojos-derecha").set_texture(ojos_textura_3)
			get_node("OJO_R/Ojos_mask-derecha/Ojo-derecho").set_texture(ojos_textura_3)
			get_node("OJO_L/Ojos_mask-izquierda/Ojos-izquierda").set_texture(ojos_textura_3)

func _cambiar_textura_bocas():
	print("Cambia textura de cara")
	match B:
		0:
			get_node("BOCA/boca_mask/Bocas").set_texture(boca_textura_1)
		1:
			get_node("BOCA/boca_mask/Bocas").set_texture(boca_textura_2)
		2:
			get_node("BOCA/boca_mask/Bocas").set_texture(boca_textura_3)
	

func _cambiar_textura_nariz():
	match N:
		0:
			get_node("NARIZ/Nariz/Nariz").set_texture(nariz_textura_1)
		1:
			get_node("NARIZ/Nariz/Nariz").set_texture(nariz_textura_2)
		2:
			get_node("NARIZ/Nariz/Nariz").set_texture(nariz_textura_3)

	
	


