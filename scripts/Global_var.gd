extends Node

var Current_Room = []
var enemies = []

#player stats
var player_max_actions: int = 3;
var player_actions: int = 3;
var player_max_health: int = 3;
var player_health: int = 3;

#1 = start turn, 2 = on turn, 0 = not turn
var players_turn: int = 1
var enemy_turn: int = 0
var enemies_death: bool = false

# Map arrays
var selectable_rooms: Array = []
var fight_rooms = []
var rest_rooms = []

#
var player_choice: int = 0
