extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocitat_base = 200
var velocitat = Vector2.ZERO 
var gravetat = Vector2.DOWN * 980
var salt = Vector2.UP * 500
# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	
	velocitat.x = 0
	
	if Input.is_action_pressed("mou dreta"):
		velocitat += Vector2.RIGHT * velocitat_base
	if Input.is_action_pressed("mou esquerra"):
		velocitat = Vector2.LEFT * velocitat_base
	if Input.is_action_pressed("mou adalt") and is_on_floor():
		velocitat += salt	
	
	velocitat += gravetat * delta
	velocitat = move_and_slide(velocitat, Vector2.UP)
	
	
func anima(velocitat: Vector2):
	var animacio : AnimatedSprite = $ AnimatedSprite
	if velocitat.x > 0:
		animacio.flip_h = false
		animacio.play('camina')
	elif velocitat.x < 0:
		animacio.flip_h = true
		animacio.play('camina')
	
		
	if velocitat.y < 0.1:
		animacio.play('salta')
		return
	
	if abs(velocitat.x) < 0.1:
		animacio.play('quiet')
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
