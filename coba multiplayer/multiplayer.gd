extends Control
@onready var ip = $URip
@onready var port = $URport

var peer = ENetMultiplayerPeer.new()
@export var player_scene : PackedScene

func _on_host_pressed():
	peer.create_server(int(port.text), 4)
	multiplayer.multiplayer_peer = peer
	multiplayer.peer_connected.connect(_add_player)
	_add_player()
	pass # Replace with function body.
	
func _add_player(id = 1):
	var player = player_scene.instantiate()
	player.name = str(id)
	call_deferred("add_child", player)

func _on_join_pressed():
	peer.create_client(ip.text, int(port.text))
	multiplayer.multiplayer_peer = peer
	pass # Replace with function body.
