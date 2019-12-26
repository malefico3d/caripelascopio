extends TextureButton

#onready var flags = get_node("/root/Mis_funciones.gd")
onready var timer = get_node("../Temporizador")

func _ready():
	set_process(true)

func _process(delta):
	if Mis_funciones.ARRASTRA and Mis_funciones.FOCO==self.name:
		OJO_L_Mover()
	
		
func OJO_L_Mover():
	#print(self.name, " está en:", self.rect_position)
	#print("ESTO ES Mover de ", self.name)
	self.rect_position = get_global_mouse_position() - Mis_funciones.OJO_IZQUIERDO_OFFSET
	#self.set_global_position(get_global_mouse_position())

func _on_OJO_L_button_up():
	#print("Han soltado", self.name) # Replace with function body.
	Mis_funciones.ARRASTRA = false
	Mis_funciones.FOCO = "none" #Limpia el foco
	timer.stop()

func _on_OJO_L_button_down():
	Mis_funciones.FOCO=self.name
	timer.start()
	#print("me han presionado")# Replace with function body.

func _on_Temporizador_timeout():
	print ("El foco lo tiene: ", Mis_funciones.FOCO)
	#if Mis_funciones.FOCO==self.name:
	Mis_funciones.ARRASTRA = true # Replace with function body.
