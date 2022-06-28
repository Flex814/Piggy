extends Area2D

export(int) var SPEED = 50

var moving = false

# Get access to animation player and sprite
onready var animationPlayer = $AnimationPlayer
onready var sprite = $Sprite

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	moving = false
	if Input.is_action_pressed("ui_right"):
		move(SPEED, 0, delta)
		sprite.flip_h = false
	if Input.is_action_pressed("ui_left"):
		move(-SPEED, 0, delta)
		sprite.flip_h = true
	if Input.is_action_pressed("ui_up"):
		move(0, -SPEED, delta)
	if Input.is_action_pressed("ui_down"):
		move(0, SPEED, delta)
	
	if moving == true:
		animationPlayer.play("Run")
	else :
		animationPlayer.play("idle")

	#Use this for multiple collisions you want to handle, like at once
#	var areas = get_overlapping_areas()
#	for area in areas:
#		area.queue_free()
	
# parameters are points/speeds on the cartesian plane. 
func move(xspeed, yspeed, delta):
	position.x += xspeed * delta
	position.y += yspeed * delta
	moving = true


func _on_Pig_area_entered(area):
	area.queue_free()
	scale *= 1.1
