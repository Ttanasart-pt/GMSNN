/// @description init
#region macro
	//#macro DELTA delta_time / 1000000
#endregion
#region draw
	draw_set_circle_precision(128);
	fps_runner = 0;
	fps_show = fps_real;
#endregion

#region score
	point[0] = 0;
	point[1] = 0;
#endregion
#region NN games
	repeat(25){
		instance_create_depth(0, 0, 0, o_game);	//create NN world
	}
	
	game_hover = -1;
	game_len = 21;
	
	nn_world_create(1);
#endregion