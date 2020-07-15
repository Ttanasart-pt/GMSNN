/// @description lerp_float(from, to, speed, precise)
/// @param from
/// @param  to
/// @param  speed
/// @param  precise

if(argument_count==4)
    var pre = argument[3];
else
    var pre = false;

if(pre){
    if(abs(argument[0]-argument[1]) < 0.00001)
        return argument[1]
    else
        return argument[0] + (argument[1] - argument[0]) / argument[2] * delta_time/15000;
} else {
    if(abs(argument[0]-argument[1]) < 0.01)
        return argument[1]
    else
        return argument[0] + (argument[1] - argument[0]) / argument[2] * delta_time/15000;
}
