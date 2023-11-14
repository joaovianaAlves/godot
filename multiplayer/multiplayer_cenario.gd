extends Node2D

const port = 4422
var peer = ENetMultiplayerPeer.new()
@export var player_scene: PackedScene


func _on_host_pressed():
	peer.create_server(port)
	multiplayer.multiplayer_peer = peer
	multiplayer.peer_connected.connect(_add_player)

func _add_player(id = 1):
	var player = player_scene.instantiate()
	player.name = str(id) 
	call_deferred("add_child", player)

func _on_join_pressed():
	peer.create_client("localhost", port)
	multiplayer.multiplayer_peer = peer
