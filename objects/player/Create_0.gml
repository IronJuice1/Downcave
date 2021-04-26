/// @desc

enum PLAYER_MOVEMENT_STATE {
	
	ON_GROUND,
	AIR
	
}

player_alive_state = PLAYER_ALIVE_STATE.ALIVE
enum PLAYER_ALIVE_STATE {
	
	ALIVE,
	DEAD
	
}

player_biome_in_currently = BIOME.ROCK

player_movement_state = PLAYER_MOVEMENT_STATE.ON_GROUND

level = 1
player_xp = 0
player_xp_required = 5

flash = 0
hp = 4
if DEV { hp = 8 }
invis_frames = 0

weapon_offset_x_value = -8
weapon_offset_x = weapon_offset_x_value
weapon_offset_y = 3

damage_factor = 1
as_factor = 1
horizontal_kb_factor = 1
vertical_kb_factor = 1
xp_orb_duration_extra = 0
xp_orb_magnet_factor = 1
orb_energy_gain = 4

extra_jumps_amount = 0
extra_jumps_ready = 0

weapon_energy_max = 12
weapon_energy = weapon_energy_max
weapon_energy_flat_regen = 1/60
weapon_energy_regen_total = 0

deepest = 0

hsp = 0
vsp = 0
gravity_player = GRAVITY

jump_power = 1.5

//First "dynamic jump" system
jump_adding = 0.55
jump_timer = 0
jump_timer_duration = 7

//Jump if we click too early
jump_pressed_remember = 0
jump_pressed_remember_value = 12
