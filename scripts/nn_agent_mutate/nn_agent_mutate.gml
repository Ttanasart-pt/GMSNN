///@description mutate network
///@param rate

var rate = argument0;

#region hidden layer
	for(var a=0; a<array_length_1d(__nn__weights); a++){
		var w = __nn__weights[a];
		var b = __nn__biases[a];
	
		for(var i=0; i<array_height_2d(w); i++){
			for(var j=0; j<array_length_2d(w, i); j++){
				w[i, j] = nn_mutate(w[i, j], rate);
				b[i, j] = nn_mutate(b[i, j], rate);
			}
		}
		__nn__weights[a] = w;
		__nn__biases[a] = b;
	}
#endregion
#region output
	for(var i=0; i<array_height_2d(__nn__output_weights); i++){
		for(var j=0; j<array_length_2d(__nn__output_weights, i); j++){
			__nn__output_weights[i, j] = nn_mutate(__nn__output_weights[i, j], rate);
			__nn__output_bias[i, j] = nn_mutate(__nn__output_bias[i, j], rate);
		}
	}
#endregion