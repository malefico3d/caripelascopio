extends TextureButton

onready var timer = get_node("../Temporizador")

func _ready():
	set_process(true)


func _process(delta):
	if Mis_funciones.ARRASTRA and Mis_funciones.FOCO==self.name:
		Mover()
	
func Mover():
	#var offsetX = self.rect_position[0]
	#var offsetY = self.rect_position[1]
	#var pos = get_global_mouse_position()
	#var fix_pos = Vector2(pos[0] - offsetX, pos[1] - offsetY)
	self.rect_position = get_global_mouse_position() - Mis_funciones.NARIZ_OFFSET
	#self.set_global_position(get_global_mouse_position())

func _on_Temporizador_timeout():
	print ("El foco lo tiene: ", Mis_funciones.FOCO)
	#if Mis_funciones.FOCO==self.name:
	Mis_funciones.ARRASTRA = true # Replace with function body.

func _on_NARIZ_button_down():
	Mis_funciones.FOCO=self.name
	timer.start()

func _on_NARIZ_button_up():
	Mis_funciones.ARRASTRA = false
	Mis_funciones.FOCO = "none" #Limpia el foco
	timer.stop()
