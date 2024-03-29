extends Node

var Current_Room = []

#[x, y, health]
var enemies = []

#player stats
var player_max_actions: int = 3;
var player_actions: int = 3;
var player_max_health: int = 3;
var player_health: int = 3;

#1 = start turn, 2 = on turn, 0 = not turn
var players_turn: int = 1
var enemy_turn: int = 0
