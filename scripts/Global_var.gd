extends Node

var Current_Room = []

#[x, y, health, actions, range, damage]
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

# Map stuffs
var selectable_rooms: Array = []
var player_choice: int = 0
var num_rooms_visited: int = 1

# Boss stuff
var boss_room: bool = false
var boss_intro: bool = false
var boss_health: int = 90
var wave_spawned: bool = false
