///@description propagate value forward
#region input and hidden layers
	for(var a=0; a<array_height_2d(__nn__neurons); a++){
		var w = __nn__weights[a];
		var b = __nn__biases[a];
	
		for(var i=0; i<array_length_2d(__nn__neurons, a); i++){
			__nn__neurons[a, i] = 0;
		
			if(a==0){
				for(var j=0; j<array_length_1d(__nn__inputs); j++){
					__nn__neurons[a, i] += __nn__inputs[j] * w[i, j] + b[i, j];	
				}
			} else {
				var len = array_length_2d(__nn__neurons, a-1);
				for(var j=0; j<len; j++){
					__nn__neurons[a, i] += __nn__neurons[a-1, j] * w[i, j] + b[i, j];	
				}
			}
		
			__nn__raw_neurons[a, i] = __nn__neurons[a, i];
			__nn__neurons[a, i] = nn_acti(__nn__neurons[a, i]);
		}
	}
#endregion
#region output layer
	for(var i=0; i<array_length_1d(__nn__outputs); i++){
		__nn__outputs[i] = 0;
		var last_hid = array_height_2d(__nn__neurons)-1;
	
		for(var j=0; j<array_length_2d(__nn__neurons, last_hid); j++){
			__nn__outputs[i] += __nn__neurons[last_hid, j] * __nn__output_weights[i, j] + __nn__output_bias[i, j];
		}
	
		__nn__outputs[i] = nn_acti(__nn__outputs[i]);
	}
#endregion