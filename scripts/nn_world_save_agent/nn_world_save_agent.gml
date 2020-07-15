///@description nn_world_save_agent
///@param agent
///@param index

var agent = argument0;
var nn_index = argument1;

__nn__max_fitness[nn_index]		= agent.__nn__fitness;
__nn__fittest[nn_index]			= agent.game;
	
with(__nn__player[nn_index]){
	nn_copy(agent);
}