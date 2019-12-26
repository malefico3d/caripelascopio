extends TextureButton

#onready var flags = get_node("/root/Mis_funciones.gd")
onready var timer = get_node("../Temporizador")

func _ready():
	set_process(true)

func _process(delta):
	if Mis_funciones.ARRASTRA and Mis_funciones.FOCO==self.name:
		Mover()
	
func Mover():
	#self.set_global_position(get_global_mouse_position())
	self.rect_position = get_global_mouse_position() - Mis_funciones.OJO_DERECHO_OFFSET

func _on_OJO_R_button_up():
	#print("Han soltado",self.name) # Replace with function body.
	Mis_funciones.ARRASTRA = false
	Mis_funciones.FOCO = "none" #Limpia el foco
	timer.stop()

func _on_OJO_R_button_down():
	Mis_funciones.FOCO=self.name
	timer.start()

func _on_Temporizador_timeout():
	#Solo reacciona al evento si el objeto fue cliqueado y no
	print ("El foco lo tiene: ", Mis_funciones.FOCO)
	#if Mis_funciones.FOCO==self.name:
	Mis_funciones.ARRASTRA = true # Replace with function body.
