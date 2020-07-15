///@description back propagate
///@param learning_rate
///@param desired_output

var rate = argument[0];
var d_var = argument_count>1? argument[1] : 0;

var layers = array_height_2d(__nn__neurons);
var cost, gradient, raw_gradient;
var delta;

/* Notes
*	delta : dE/dy used in hidden layer propagation
*/

#region output layer
	/*		For each weight/bias in output layer
	*	1) Find error/cost function derivative (dE/dY from script cc_error_derivative)
	*	2) Find activation function derivative (dY/dy from script nn_acti_derivative)
	*	3) Find value-weight derivative (dy/dw = w in most case)
	*	4) Gradient = Multiply 1)*2)*3) (error/value derivative)
	*	5) Use gradient to recalculate weight/bias
	*	6) save gradient as delta matrix i = layers-1
	*/
	for(var o=0; o<array_length_1d(__nn__outputs); o++){
		for(var i=0; i<array_height_2d(__nn__output_weights); i++){
			var cost = nn_error(__nn__outputs[o], d_var[o]);
			
			for(var j=0; j<array_length_2d(__nn__output_weights, i); j++){
				raw_gradient = nn_error_derivative(__nn__outputs[o]) 
							* nn_acti_derivative(__nn__neurons[layers-1, j])
							* cost;
				gradient = raw_gradient * __nn__neurons[layers-1, j];
				
				__nn__output_weights[i, j] = __nn__output_weights[i, j] - rate * gradient;
				if(global.__nn__weightclamp)
					__nn__output_weights[i, j] = clamp(__nn__output_weights[i, j], -1, 1)
				delta[layers-1, j] = raw_gradient * __nn__raw_neurons[layers-1, j];
			}
		}
	}
#endregion

#region hidden layers
	/*		For each weight/bias in hidden layer
	*	1) Find sum of delta * weight of the next layer
	*	2) Find delta on i=layer by nn_acti_derivative(raw_neuron) * 1)
	*	3) Gradient = 2) * (dy/dw : w)
	*	4) If there's more layer backward, save gradient as delta matrix i = a-1
	*/
	var sum_dw = 0;
	
	for(var a=layers-1; a>=0; a--){
		var w = __nn__weights[a];
		var b = __nn__biases[a];
		
		for(var i=0; i<array_height_2d(w); i++){
			for(var j=0; j<array_length_2d(w, i); j++){
				sum_dw = 0;
				#region delta sum
					if(a==layers-1){
						for(var k=0; k<array_length_1d(__nn__outputs); k++){
							sum_dw += delta[a, k] * __nn__output_weights[k, i];
						}
					} else {
						var w_n = __nn__weights[a+1];
						for(var k=0; k<array_length_2d(__nn__neurons, a+1); k++){
							sum_dw += delta[a, k] * w_n[k, i];
						}
					}
				#endregion
				gradient = __nn__neurons[a, i] * sum_dw;
				w[i, j] = w[i, j] - rate * gradient;
				if(global.__nn__weightclamp)
					w[i, j] = clamp(w[i, j], -1, 1)
				
				if(a>0) delta[a-1, i] = nn_acti_derivative(__nn__raw_neurons[a, i]) * sum_dw;
			}
		}
		
		__nn__weights[a] = w;
		__nn__biases[a] = b;
	}
#endregion