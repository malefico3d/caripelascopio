extends TextureButton

#onready var boton = $TextureButton
onready var timer= $Tempo

var MENU = false
var ARRASTRA = false

func _ready():
	set_process(true)

func _process(delta):
	if ARRASTRA:
		Mover()
	
		
func Mover():
	print(self.rect_position)
	self.rect_position = get_global_mouse_position()

func _on_TextureButton_pressed():
	print("CLIC")
	pass # Replace with function body.
	

func _on_TextureButton_button_up():
	print("me han soltado") # Replace with function body.
	ARRASTRA = false
	timer.stop()

func _on_TextureButton_button_down():
	timer.start()
	print("me han presionado")# Replace with function body.


func _on_Timer_timeout():
	ARRASTRA = true # 
	
