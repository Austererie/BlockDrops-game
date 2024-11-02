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





#Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
