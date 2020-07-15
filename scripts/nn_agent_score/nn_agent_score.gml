///@description nn_agent_score
///@param score
///@param base=1

var _score = argument[0];
var base = argument_count>1? argument[1] : 1;

__nn__score += _score;
__nn__avg_base += base;

if(base==0)
	__nn__fitness = __nn__score
else
	__nn__fitness = __nn__score / __nn__avg_base;