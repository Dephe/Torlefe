//Player input
key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_jump = keyboard_check_pressed(vk_space);
key_jump_held = keyboard_check(vk_space);

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
if (mouse_check_button(mb_left)) && (AAdelay < 0) && (AAcharges <= 4) && (AAcharges > 0)
{
	AAdelay = 30;
	AAcharges -= 1
	with (instance_create_layer(x,y,"HitboxSkill",oAAMage))
	{
		speed = 3;
		image_angle = point_direction(x,y,mouse_x,mouse_y);
		direction = image_angle;
	}
}

if (AAcharges = 0) && (AAdelay < -30) AAcharges = 4


