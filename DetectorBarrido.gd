extends Node

signal barrido(direccion)
signal barrido_cancela(start_pos)

export (float, 1.0, 1.5) var MAX_PENDIENTE_DIAGONAL = 1.3

onready var timer = $Timer
var barrido_start_pos = Vector2()

func _input(event):
	if not event is InputEventScreenTouch:
		return
	if event.pressed:
		_detectar_inicio(event.position)
	elif not timer.is_stopped():
		_detectar_fin(event.position)
		
	pass

func _detectar_inicio(position):
	barrido_start_pos = position
	timer.start()

func _detectar_fin(position):
	timer.stop()
	var direccion = (position - barrido_start_pos).normalized()
	if abs(direccion.x) + abs(direccion.y) >= MAX_PENDIENTE_DIAGONAL:
		return
	if abs(direccion.x) > abs(direccion.y):
		emit_signal('barrido', Vector2(-sign(direccion.x), 0.0))
	else:
		emit_signal('barrido', Vector2(0.0, -sign(direccion.y)))
		
func _on_Timer_timeout():
	emit_signal('barrido_cancela', barrido_start_pos)
