///@description activation function
///@param value

var _x = argument[0];
var all_x = argument_count>1? argument[1] : 0;
var _e = 2.71828182;

var e_x = power(_e, _x);
var e_ix = 1 / e_x;

switch(global.__nn__acti){
	case nn_acti_type.tanh:
		return (e_x-e_ix) / (e_x+e_ix);
		
	case nn_acti_type.softmax:
		var soft_sum = 0;
		for( var i=0; i<array_length_1d(all_x); i++){
			soft_sum += power(_e, all_x[i]);	
		}
		return e_x / soft_sum;
		
	case nn_acti_type.sigmoid:
		return e_x / (e_x+1);
		
}