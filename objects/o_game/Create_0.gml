/// @description init
#region data
	playing = true;
	agent = instance_create_depth(0, 0, -100, o_nn_agent);
	agent.game = id;
	
	game_round = 0;
#endregion