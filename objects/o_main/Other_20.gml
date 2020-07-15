/// @description train
#region save & mutate
	if(game_done.agent.__nn__fitness >= __nn__max_fitness[0]){
		nn_world_save_agent(game_done.agent, 0);
	}

	with(game_done.agent){
		nn_copy(other.__nn__player[0]);	
		nn_agent_mutate(.4);
		nn_agent_reset();
	}
#endregion
#region evolve
	__nn__offspring++;
	if(__nn__offspring > __nn__gen_size){
		nn_world_evolve();
	}
#endregion