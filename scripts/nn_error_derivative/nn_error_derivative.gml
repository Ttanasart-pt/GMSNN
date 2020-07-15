///@description nn_error_derivative
///@param value

var val = argument[0];

switch(global.__nn__erro){
	case nn_error_type.different:
		return -1;
	case nn_error_type.cross_entropy_loss:
		return val == 1? -1 / val : 1 / (1 - val);
}