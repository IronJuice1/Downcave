/// @desc

var _input = _input_manager

//TEST KNOCKBACK
if DEV {
if keyboard_check_pressed(ord("Y")) {
	hsp += 3	
}

if keyboard_check(vk_space) {
	vsp -= 3	
}
}


// Set "player_movement_state"
if place_meeting(x, y + 1, parent_collision)
	player_movement_state = PLAYER_MOVEMENT_STATE.ON_GROUND
else
	player_movement_state = PLAYER_MOVEMENT_STATE.AIR

#region Horizontal

	var dir = _input.right_hold - _input.left_hold
	
	if (hsp > PLAYER_BASE_MAX_HSP) or (hsp < -PLAYER_BASE_MAX_HSP)
		hsp += dir * PLAYER_BASE_ACC*0.5
	else 
		hsp += dir * PLAYER_BASE_ACC
		
	//Friction + hsp_speed_max
	if (dir == 0)				//When we are not pressing anything
	{
		if (player_movement_state == PLAYER_MOVEMENT_STATE.ON_GROUND) { var _fric = PLAYER_BASE_FRIC }
		if (player_movement_state == PLAYER_MOVEMENT_STATE.AIR) { var _fric = PLAYER_BASE_FRIC_AIR }
	
		hsp = approach(hsp, 0, _fric)
	
	}

	if (hsp > PLAYER_BASE_MAX_HSP) {
		hsp = approach(hsp, PLAYER_BASE_MAX_HSP, PLAYER_BASE_ACC*0.5)
		hsp = hsp*0.98
	}
	
	if (hsp < -PLAYER_BASE_MAX_HSP) {
		hsp = approach(hsp, -PLAYER_BASE_MAX_HSP, PLAYER_BASE_ACC*0.5)
		hsp = hsp*0.98
	}
	
#endregion

#region Jump

jump_pressed_remember = max(jump_pressed_remember - 1, 0)
jump_timer = max(jump_timer - 1, 0)

if (_input.action_1_clicked)
{
	jump_pressed_remember = jump_pressed_remember_value	
}

if (jump_pressed_remember > 0) and (player_movement_state == PLAYER_MOVEMENT_STATE.ON_GROUND) {
	
	player_movement_state = PLAYER_MOVEMENT_STATE.AIR
	jump_pressed_remember = 0
	vsp -= jump_power
	jump_timer = jump_timer_duration
	
}

//Add height to jump
if (_input.action_1_hold) and (jump_timer > 0) {
	vsp -= jump_adding	
}

#endregion

#region Vertical + Limit Vsp

if (player_movement_state == PLAYER_MOVEMENT_STATE.AIR) { vsp += gravity_player }

//Moving Down
if (vsp > PLAYER_BASE_MAX_VSP) {
	vsp = approach(vsp,PLAYER_BASE_MAX_VSP,gravity_player*0.9)
	vsp = vsp*0.985
}

if (vsp < -PLAYER_BASE_MAX_VSP) {
	vsp = approach(vsp,-PLAYER_BASE_MAX_VSP,gravity_player)
	vsp = vsp*0.98
}

if place_meeting(x, y + 8, parent_collision) {
	
	//if vsp > 0 { gravity_player = GRAVITY*4 }
	
	if vsp < 0 { gravity_player = GRAVITY*0.5 }
	
	
} else {
	
	//Inc Grv when falling
	if vsp >= 0 {
		gravity_player = GRAVITY
	} else {
		gravity_player = GRAVITY*1.1
	}
	
}


#endregion


#region Collision (Vertical and Horizontal)

//Horizontal Collision
if (place_meeting(x + hsp, y, parent_collision))
{
	while (!place_meeting(x + sign(hsp), y, parent_collision))
		{
			x += sign(hsp)	
		}
	hsp = 0
}
x += hsp

//Vertical Collision
if (place_meeting(x, y + vsp, parent_collision))
{
	while (!place_meeting(x, y + sign(vsp), parent_collision))
		{
			y += sign(vsp)	
		}
	vsp = 0
}
y += vsp

#endregion

if deepest < y {
	deepest = y	
}

if x < 0 or x > room_width {
	
	//Die
	event_user(0)
	
}

//Energy % Regen
weapon_energy += weapon_energy_max/(60*16)

weapon_energy += weapon_energy_flat_regen

weapon_energy = min(weapon_energy, weapon_energy_max)