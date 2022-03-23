extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text" 
var velocitat = 1000
var direccio = Vector2(0,0)
# Called when the node enters the scene tree for the first time.
func _ready():
	rotation_degrees = 0
	position = Vector2(500, 300)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += velocitat * delta * direccio
	if Input.is_action_pressed("mou dreta"):
		direccio += Vector2.RIGHT
	if Input.is_action_pressed("mou esquerra"):
		direccio += Vector2.LEFT
	if Input.is_action_pressed("mou adalt"):
		direccio += Vector2.UP
	if Input.is_action_pressed("mou abaix"):
		direccio += Vector2.DOWN
	
	position += velocitat * delta * direccio.normalized()
	
	direccio = Vector2(0,0)


func _on_Personatges_area_entered(area):
	modulate = Color(0,1,0,1)
	

func _on_Personatges_area_exited(area):
	modulate = Color(1,1,1)

