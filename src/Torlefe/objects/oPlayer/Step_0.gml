//Player input
key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_jump = keyboard_check_pressed(vk_space);
key_jump_held = keyboard_check(vk_space);
key_utility = keyboard_check_pressed(vk_shift);

//Movement
grounded = place_meeting(x,y+1,oWall)
airborne = !grounded
move = key_right - key_left;

//Left and right grounded
hsp = move * walksp;

vsp = vsp + grv;

//Jump
if (place_meeting(x,y+1,oWall)) and (key_jump)
{
	vsp = vsp + jumpsp;
	
}

//Held jump

if (vsp < 0) and (!key_jump_held) 
{
	vsp = max(vsp, jumpsp/3)
}


//Collision
//Horizontal

if (place_meeting(x+hsp,y,oWall))
{
	while (!place_meeting(x+sign(hsp),y,oWall))
	{
		x = x +sign(hsp);
	}
	hsp=0;
}

x = x + hsp; 

//Vertical
if (place_meeting(x,y+vsp,oWall))
{
	while (!place_meeting(x,y+sign(vsp),oWall))
	{
		y = y +sign(vsp);
	}
	vsp=0;
}

y = y + vsp;

//Animation

if not_blink <= 0 {

	if hsp != 0 && vsp == 0 {
		sprite_index = sTechnoMRun; } else sprite_index = sTechnoMIdle;
}


if hsp != 0 image_xscale = sign(hsp);



//AA

AAdelay -= 1
if (mouse_check_button(mb_left)) && (AAdelay < 0) && (AAcharges <= 4)
{
	AAdelay = 30;
	AAcharges -= 1
	
	
	if (AAcharges == 3)
	{
		var AA1 = instance_create_layer(x+40,y-20,"HitboxSkill",oAAMage)
		with (AA1)
		{
			followid = other.id
			AAx = 40
			AAy = -20
			
		}
	}	
	
	else if (AAcharges == 2)
	{
		var AA2 = instance_create_layer(x+20,y-40,"HitboxSkill",oAAMage)
		with (AA2)
		{
			followid = other.id
			AAx = 20
			AAy = -40
			
		}
	}
	
	else if (AAcharges == 1)
	{
		var AA3 = instance_create_layer(x-20,y-40,"HitboxSkill",oAAMage)
		with (AA3)
		{
			followid = other.id
			AAx = -20
			AAy = -40
		
		}
	}
	
	else if (AAcharges == 0)
	{
		var AA4 = instance_create_layer(x-40,y-20,"HitboxSkill",oAAMage)
		with (AA4)
		{
			followid = other.id
			AAx = -40
			AAy = -20
		
		}
	}
	
}



//if (AAcharges = 0) && (AAdelay < -30) AAcharges = 4 después implemento


//rightclick

if mouse_check_button(mb_right) and bolt_cooldown == 0 {
	bolt_step = 0
	while bolt_step < bolt_range {
		if collision_line(x, y, x+lengthdir_x(bolt_step,point_direction(x,y,mouse_x, mouse_y)), y+lengthdir_y(bolt_step,point_direction(x,y,mouse_x, mouse_y)), oMaskyDude,false,false) {
			bolted_dude = collision_line(x, y, x+lengthdir_x(bolt_step,point_direction(x,y,mouse_x, mouse_y)), y+lengthdir_y(bolt_step,point_direction(x,y,mouse_x, mouse_y)), oMaskyDude,false,false)
			bolt_step = bolt_range;
			draw_bolt = 1;
			bolt_cooldown = bolt_cooldown_init;
		} else {
			bolt_step += 1
		}
	}
}

if bolt_cooldown > 0 {
	bolt_cooldown -= 1;
}

//Blink
if key_utility and blink_cd == 0 {
	var ox = x
	var oy = y 
	
	while blink_step < blink_range {
		touch_wall = place_meeting(ox + lengthdir_x(blink_step, point_direction(ox, oy, mouse_x, mouse_y)), oy + lengthdir_y(blink_step, point_direction(ox, oy, mouse_x, mouse_y)), oWall );
		if !touch_wall {
			blink_step += 1;
		} 
		if touch_wall {
			sprite_index = sTechnoMBlink;
			not_blink = 20;
			x = ox + lengthdir_x(blink_step-1, point_direction(ox, oy, mouse_x, mouse_y));
			y = oy + lengthdir_y(blink_step-1, point_direction(ox, oy, mouse_x, mouse_y));
			blink_cd = init_blink_cd;
			airtime = init_airtime;
			blink_step = blink_range;
			
		}
		if blink_step+1 == blink_range {
			if point_distance(x, y, mouse_x, mouse_y) > blink_range {
				sprite_index = sTechnoMBlink
				not_blink = 20;
				x = ox + lengthdir_x(blink_range, point_direction(ox, oy, mouse_x, mouse_y));
				y = oy + lengthdir_y(blink_range, point_direction(ox, oy, mouse_x, mouse_y));
				blink_cd = init_blink_cd;
				airtime = init_airtime;
				blink_step = blink_range;
				
			} else if point_distance(x, y, mouse_x, mouse_y) < blink_range {
				sprite_index = sTechnoMBlink
				not_blink = 20;
				x = ox + lengthdir_x(point_distance(x, y, mouse_x, mouse_y), point_direction(ox, oy, mouse_x, mouse_y));
				y = oy + lengthdir_y(point_distance(x, y, mouse_x, mouse_y), point_direction(ox, oy, mouse_x, mouse_y));
				blink_cd = init_blink_cd;
				airtime = init_airtime;
				blink_step = blink_range;
				
			}
		}
	}	
}

if airtime > 0 {
	vsp = 0
	hsp = 0
	airtime -= 1
}

if blink_cd > 0 {
	blink_cd -=1
}

blink_step = 0;
not_blink -= 1;

//HP
if player_hp < 1 {
	game_restart();
	instance_destroy();
}