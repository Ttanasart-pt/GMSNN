///@description set up NN world
///@param players
var players = argument0;

__nn__offspring = 0;
__nn__generation = 0;
__nn__gen_size = 60; //iteration before apply best agent

__nn__players = players;

for(var i=0; i<__nn__players; i++){
	__nn__player[i] = instance_create_depth(0,0,0, o_nn_data);
	
	__nn__player[i].__nn__weights = -1;
	__nn__player[i].__nn__biases = -1;
	__nn__player[i].__nn__output_weights = -1;
	__nn__player[i].__nn__output_bias = -1;
	
	__nn__fittest[i] = noone;
	__nn__max_fitness[i] = -999;
}

enum nn_acti_type{
	tanh,
	sigmoid,
	softmax
}
enum nn_error_type{
	different,
	cross_entropy_loss
}
enum nn_draw_alignment{
	top_left,
	top_right,
	bottom_left,
	bottom_right
}

global.__nn__object = self; //main object to call when evolving
global.__nn__acti = nn_acti_type.tanh; //activation function type
global.__nn__erro = nn_error_type.different; //error function type
global.__nn__weightclamp = false; //clamp weight or not