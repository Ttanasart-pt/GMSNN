///@description mutate value
///@param value
///@param rate

var val = argument0;
var rate = argument1;
var chan = random(100);

if(chan < 10*rate){
	val *= -1;	
} else if(chan < 20*rate){
	val = random_range(-1, 1);
} else if(chan < 45*rate){
	val = random_range(val, val*2);
} else if(chan < 70*rate){
	val = random_range(0, val);
} 

return global.__nn__weightclamp? clamp(val, -1, 1) : val;