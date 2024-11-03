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
var d_90 := [Vector2i(1,0), Vector2i(2,0), Vector2(1,1), Vector2i(1,2)]
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
var f_180 := [Vector2i(0,1), Vector2(1,1), Vector2i(2,1), Vector2i(2,2)]
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
const START_POS := Vector2i(5,1)
var cur_pos : Vector2i


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
	piece_type = pick_piece()
	piece_atlas = Vector2i(shapes_full.find(piece_type), 0)
	create_piece()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

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
	
	
	
	
func draw_piece(piece, pos, atlas):
	for i in piece:
		set_cell(active_layer, pos + i, tile_id, atlas)


	
