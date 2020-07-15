///@description error calculation
///@param value
///@param desired

var val = argument[0];
var d_val = argument_count>1? argument[1] : 0;

switch(global.__nn__erro){
	case nn_error_type.different:
		return d_val - val;
	case nn_error_type.cross_entropy_loss:
		return val == 1? -ln(val) : -ln(1 - val);
}