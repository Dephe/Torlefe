/// @description Insert description here
// You can write your code in this editor

image_speed = 0;

if instance_exists(oPlayer) {
move_towards_point(oPlayer.x, oPlayer.y, mask_speed);
}
mask_speed += 0.00;

if mask_speed > 0.61 and mask_speed < 1.21 {
image_index = 1;
}

if mask_speed > 1.22 and mask_speed < 1.82 {
image_index = 2;
}

if mask_speed > 1.83 and mask_speed < 2.43 {
image_index = 3;
}

if mask_speed > 2.44 and mask_speed <= 3.04 {
sprite_index = sMaskyDude_enrage;
}

if mask_speed > 3.04 {
sprite_index = sMaskyDude_enrage;
image_speed = 1;
}

if mask_hp < 1 {
	instance_destroy()
}


if place_meeting(x, y, oPlayer) {
	oPlayer.player_hp -= 1;
	instance_destroy();
	}
	
if place_meeting(x,y,oAAMage) {
		self.mask_hp -= 1;
}
