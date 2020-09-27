/// @description Insert description here
// You can write your code in this editor

if instance_exists(oPlayer) {
	if masky_interval < 0 {
		dist_to_player = random_range(-400, 400)
		while abs(dist_to_player) < 100 {
			dist_to_player = random_range(-400, 400)
		}
		instance_create_layer(oPlayer.x + dist_to_player, oPlayer.y + dist_to_player,  "Enemies", oMaskyDude);
		masky_interval = masky_interval_init;
	}

	masky_interval -= 1;
}