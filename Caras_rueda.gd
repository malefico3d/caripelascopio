extends Node2D

var is_inside = false

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_Area2D_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("left_click"):
		is_inside = true # Replace with function body.
	if event.is_action_released("left_click"):
		is_inside = false
