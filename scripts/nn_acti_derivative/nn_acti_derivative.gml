///@description activation function derivative
///@param value

var _x = argument[0];
//var _e = 2.71828182;

switch(global.__nn__acti){
	case nn_acti_type.tanh:
		return 1 - power(nn_acti(_x), 2);
	case nn_acti_type.softmax:
		return _x / (-_x+1);
	case nn_acti_type.sigmoid:
		var _ax = nn_acti(_x);
		return _ax * (1-_ax);
}