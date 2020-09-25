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

if (hsp != 0) && (vsp == 0) sprite_index = sNoviceR; else sprite_index = sNovice;

if (hsp != 0) image_xscale = sign(hsp);

//AA
AAdelay -= 1
if (mouse_check_button(mb_left)) && (AAdelay < 0) && (AAcharges <= 4)
{
	AAdelay = 30;
	AAcharges -= 1
	
	
	if (AAcharges == 3)
	{
		AAball1 = instance_create_layer(x+40,y-20,"HitboxSkill",oAAMage)
		with (AAball1)
		{
			followid = other.id
			AAx = 40
			AAy = -20
		}
	}
	
	else if (AAcharges == 2)
	{
		AAball2 = instance_create_layer(x+20,y-40,"HitboxSkill",oAAMage)
		with (AAball2)
		{
			followid = other.id
			AAx = 20
			AAy = -40
		}
	}
	
	else if (AAcharges == 1)
	{
		AAball3 = instance_create_layer(x-20,y-40,"HitboxSkill",oAAMage)
		with (AAball3)
		{
			followid = other.id
			AAx = -20
			AAy = -40
		}
	}
	
	else if (AAcharges == 0)
	{
		AAball4 = instance_create_layer(x-40,y-20,"HitboxSkill",oAAMage)
		with (AAball4)
		{
			followid = other.id
			AAx = -40
			AAy = -20
		}
	}
	
	else if (mouse_check_button_released(mb_left)) && (instance_exists(AAball1)) || (instance_exists(AAball2)) || (instance_exists(AAball3)) || (instance_exists(AAball4))
	{
		with (AAball1)
		{
		move_towards_point(mouse_x, mouse_y, 10)
		}
	}
	
	else if (AAcharges == -1)
	{
		instance_destroy(AAball1)
		instance_destroy(AAball2)
		instance_destroy(AAball3)
		instance_destroy(AAball4)
		AAcharges = 4
		
	}
}
//if (AAcharges = 0) && (AAdelay < -30) AAcharges = 4 después implemento


//Blink

if key_utility and blink_cd == 0 {
	var ox = x
	var oy = y 
	while blink_step < blink_range {
		if !place_meeting(ox + lengthdir_x(blink_step, point_direction(ox, oy, mouse_x, mouse_y)), oy + lengthdir_y(blink_step, point_direction(ox, oy, mouse_x, mouse_y)), oWall ) {
			blink_step += 1;
		} 
		if place_meeting(ox + lengthdir_x(blink_step, point_direction(ox, oy, mouse_x, mouse_y)), oy + lengthdir_y(blink_step, point_direction(ox, oy, mouse_x, mouse_y)), oWall ) {
			blink_step = blink_range;
		}
		if blink_step+1 == blink_range {
			if point_distance(x, y, mouse_x, mouse_y) > blink_range {
				x = ox + lengthdir_x(blink_range, point_direction(ox, oy, mouse_x, mouse_y));
				y = oy + lengthdir_y(blink_range, point_direction(ox, oy, mouse_x, mouse_y));
				blink_cd = 30;
				airtime = 10;
				blink_step = blink_range;
			} else if point_distance(x, y, mouse_x, mouse_y) < blink_range {
				x = ox + lengthdir_x(point_distance(x, y, mouse_x, mouse_y), point_direction(ox, oy, mouse_x, mouse_y));
				y = oy + lengthdir_y(blink_range, point_direction(ox, oy, mouse_x, mouse_y));
				blink_cd = 30;
				airtime = 10;
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