extends Control

var player_count = 0
var results = []

# UI 노드 참조
@onready var count_input = $VBoxContainer/CountInput
@onready var confirm_btn = $VBoxContainer/ConfirmButton
@onready var players_container = $VBoxContainer/PlayersContainer
@onready var generate_btn = $VBoxContainer/GenerateButton
@onready var output_text = $VBoxContainer/OutputText

func _ready():
	confirm_btn.pressed.connect(_on_confirm)
	generate_btn.pressed.connect(_on_generate)

func _on_confirm():
	players_container.clear()  # 기존 입력 삭제
	player_count = int(count_input.text)
	for i in range(player_count):
		var le = LineEdit.new()
		le.placeholder_text = "플레이어 %d 결과 입력" % (i + 1)
		players_container.add_child(le)

func _on_generate():
	results.clear()
	for le in players_container.get_children():
		results.append(le.text)
	
	var order = get_random_order(player_count)
	var output = "사다리 게임 결과:\n"
	for i in range(player_count):
		output += "플레이어 %d → %s\n" % [i+1, results[order[i]]]
	output_text.text = output

# 0 ~ n-1 범위 랜덤 순서
func get_random_order(n):
	var arr = []
	for i in range(n):
		arr.append(i)
	arr.shuffle()
	return arr
