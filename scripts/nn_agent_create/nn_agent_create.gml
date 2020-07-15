///@description create new agent
///@param input
///@param hidden
///@param output

var in_lay = argument0;
var hi_lay = argument1;
var ot_lay = argument2;

#region data
	__nn__score = 0;
	__nn__avg_base = 0;
	__nn__fitness = 0;
#endregion
#region input nodes
	for(var i=0; i<in_lay; i++){
		__nn__inputs[i] = 0;	
	}
#endregion
#region hidden nodes
	for(var a=0; a<array_length_1d(hi_lay); a++){
		var hidd_len = hi_lay[a];
	
		var weight = 0;
		var bias = 0;
		for(var i=0; i<hidd_len; i++){
			__nn__neurons[a, i] = 0;
			__nn__raw_neurons[a, i] = 0;
			var prev_len = a==0? in_lay : hi_lay[a-1];
		
			for(var j=0; j<prev_len; j++){
				weight[i, j] = random_range(-1.0, 1.0);
				bias[i, j] = random_range(-1.0, 1.0);
			}
		}
		__nn__weights[a] = array_duplicate_2D(weight);
		__nn__biases[a] = array_duplicate_2D(bias);
	}
#endregion
#region output nodes
	for(var i=0; i<ot_lay; i++){
		__nn__outputs[i] = 0;
	
		var len = hi_lay[array_length_1d(hi_lay)-1];
		for(var j=0; j<len; j++){
			__nn__output_weights[i, j] = random_range(-1.0, 1.0);	
			__nn__output_bias[i, j] = random_range(-1.0, 1.0);
		}
	}
#endregion