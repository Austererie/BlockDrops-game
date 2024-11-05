extends TileMap

var a_0 := [Vector2i(0,1), Vector2i(1,1), Vector2i(2,1), Vector2i(3,1) ]
var a_90 := [Vector2i(2, 0), Vector2i(2,1), Vector2i(2,2), Vector2i(2,3)]
var a_180 := [Vector2i(0,2), Vector2i(1,2), Vector2i(2,2), Vector2i(3,2)]
var a_270 := [Vector2i(1,0), Vector2i(1,1), Vector2i(1,2), Vector2i(1,3)]
var a := [a_0, a_90, a_180, a_270]


var b_0 := [Vector2i(1,0), Vector2i(0,1), Vector2i(1,1), Vector2i(2,1)]
var b_90 := [Vector2i(1, 0), Vector2i(1,1), Vector2i(2,1), Vector2i(1,2)]
var b_180 := [Vector2i(0,1), Vector2i(1,1), Vector2i(2,1), Vector2i(1,2)]
var b_270 := [Vector2i(1,0), Vector2i(0,1), Vector2i(1,1), Vector2i(1,2)]
var b := [b_0, b_90, b_180, b_270]

var c_0 := [Vector2i(0,0), Vector2i(1,0), Vector2i(0,1), Vector2i(1,1)]
var c_90 := [Vector2i(0,0), Vector2i(1,0), Vector2i(0,1), Vector2i(1,1)]
var c_180 := [Vector2i(0,0), Vector2i(1,0), Vector2i(0,1), Vector2i(1,1)]
var c_270 := [Vector2i(0,0), Vector2i(1,0), Vector2i(0,1), Vector2i(1,1)]
var c := [c_0, c_90, c_180, c_270]

var d_0 := [Vector2i(2,0), Vector2i(0,1), Vector2i(1,1), Vector2i(2,1)]
var d_90 := [Vector2i(1,0), Vector2i(2,0), Vector2i(1,1), Vector2i(1,2)]
var d_180 := [Vector2i(0,1), Vector2i(1,1), Vector2i(2,1), Vector2i(2,2)]
var d_270 := [Vector2i(1,0), Vector2i(1,1), Vector2i(0,2), Vector2i(1,2)]
var d := [d_0, d_90, d_180, d_270]

var e_0 := [Vector2i(1,0), Vector2i(2,0), Vector2i(0,1), Vector2i(1,1)]
var e_90 := [Vector2i(1,0), Vector2i(1,1), Vector2i(2,1), Vector2i(2,2)]
var e_180 := [Vector2i(1,1), Vector2i(2,1), Vector2i(0,2), Vector2i(1,2)]
var e_270 := [Vector2i(0,0), Vector2i(0,1), Vector2i(1,1), Vector2i(1,2)]
var e := [e_0, e_90, e_180, e_270]

var f_0 := [Vector2i(0,0), Vector2i(0,1), Vector2i(1,1), Vector2i(2,1)]
var f_90 := [Vector2i(1,0), Vector2i(2,0), Vector2i(1,1), Vector2i(1,2)]
var f_180 := [Vector2i(0,1), Vector2i(1,1), Vector2i(2,1), Vector2i(2,2)]
var f_270 := [Vector2i(1,0), Vector2i(1,1), Vector2i(0,2), Vector2i(1,2)]
var f := [f_0, f_90, f_180, f_270]

var g_0 := [Vector2i(0,0), Vector2i(1,0), Vector2i(1,1), Vector2i(2,1)]
var g_90 := [Vector2i(1,0), Vector2i(0,1), Vector2i(1,1), Vector2i(0,2)]
var g_180 := [Vector2i(1,0), Vector2i(2,0), Vector2i(0,1), Vector2i(1,1)]
var g_270 := [Vector2i(0,0), Vector2i(0,1), Vector2i(1,1), Vector2i(1,2)]
var g := [g_0, g_90, g_180, g_270]

var shapes := [a, b, c, d, e, f, g]
var shapes_full := shapes.duplicate()

#Grid variables
const COLS : int = 10
const ROWS : int = 20

#Movement variables
const DIRECTIONS := [Vector2i.LEFT, Vector2i.RIGHT, Vector2i.DOWN]
var steps : Array
const STEPS_REQ : int = 50
const START_POS := Vector2i(5,1)
var cur_pos : Vector2i
var speed : float



#Game piece variables
var piece_type
var next_piece_type
var rotation_index : int = 0
var active_piece: Array

#Tilemap variables
var tile_id : int = 0
var piece_atlas : Vector2i
var next_piece_atlas: Vector2i


#Layer Variables 
var board_layer : int = 0
var active_layer : int = 1


#Called when the node enters the scene tree for the first time.
func _ready() -> void:
	new_game()
	
	
func new_game():
	#reset variables
	speed = 1.0
	steps = [0, 0, 0]
	$HUD.get_node("gameOverLabel").hide()
	
	piece_type = pick_piece()
	piece_atlas = Vector2i(shapes_full.find(piece_type), 0)
	next_piece_type = pick_piece()
	next_piece_atlas = Vector2i(shapes_full.find(piece_type), 0)
	create_piece()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_left"):
		steps[0] += 10
	elif Input.is_action_pressed("ui_right"):
		steps[1] += 10
	elif Input.is_action_pressed("ui_down"):
		steps[2] += 10
	elif Input.is_action_pressed("ui_up"):
		rotate_piece()
		
	#apply downard movement everyframe
	steps[2] += speed
	#move piecce
	for i in range(steps.size()):
		if steps[i] > STEPS_REQ:
			move_piece(DIRECTIONS[i])
			steps[i] = 0
		
		
	


func pick_piece():
	var piece
	if not shapes.is_empty():
		shapes.shuffle()
		piece = shapes.pop_front()
	else:
		shapes = shapes_full.duplicate()
		piece = shapes.pop_front()
	return piece
		
	
func create_piece():
	#reset variables
	cur_pos = START_POS
	active_piece = piece_type[rotation_index]
	draw_piece(active_piece, cur_pos, piece_atlas)
	#show next piece
	draw_piece(next_piece_type[0], Vector2i(15, 6), next_piece_atlas)
	
func clear_piece():
	for i in active_piece:
		erase_cell(active_layer, cur_pos + i)
		
	
func draw_piece(piece, pos, atlas):
	for i in piece:
		set_cell(active_layer, pos + i, tile_id, atlas)

func move_piece(dir):
	if can_move(dir):
		clear_piece()
		cur_pos += dir
		draw_piece(active_piece, cur_pos, piece_atlas)
	else:
		if dir == Vector2i.DOWN:
			land_piece()
			check_rows()
			piece_type = next_piece_type
			piece_atlas = next_piece_atlas
			next_piece_type = pick_piece()
			next_piece_atlas = Vector2i(shapes_full.find(next_piece_type), 0)
			clear_panel()
			create_piece()
		  
	
func rotate_piece():
	if can_rotate():
		clear_piece()
		rotation_index = (rotation_index + 1) % 4
		active_piece = piece_type[rotation_index]
		draw_piece(active_piece, cur_pos, piece_atlas)

func 	land_piece():
	#removing the piece from the active layer to the board layer once it hits the bottom
	for i in active_piece:
		erase_cell(active_layer, cur_pos + i)
		set_cell(board_layer, cur_pos + i, tile_id, piece_atlas)
	
	
	
func can_move(dir):
	#check if there is space to move
	var cm = true
	for i in active_piece:
		if not is_free(i + cur_pos + dir):
			cm = false
	return cm

func can_rotate():
	var cr = true
	var temp_rotation_index = (rotation_index + 1) % 4
	for i in piece_type[temp_rotation_index]:
		if not is_free(i + cur_pos):
			cr = false
	return cr
			
func is_free(pos):
	return get_cell_source_id(board_layer, pos) == -1

func clear_panel():
	for i in range(14, 19):
		for j in range(5, 9):
			erase_cell(active_layer, Vector2i(i, j))
		
func check_rows():
	var row : int = ROWS
	while row > 0:
		var count = 0
		for i in range(COLS):
			if not is_free(Vector2i(i + 1, row)):
				count+=1
		if count == COLS:
			shift_rows(row)
		else:
			row -= 1

func shift_rows(row):
	var atlas
	for i in range(row, 1, -1):
		for j in COLS:
			atlas = get_cell_atlas_coords(board_layer, Vector2i(j + 1, i - 1))
			if atlas == Vector2i(-1, -1):
				erase_cell(board_layer, Vector2i(j +1, i))
			else:
				set_cell(board_layer, Vector2i(j + 1, i), tile_id, atlas)
		
		
				
