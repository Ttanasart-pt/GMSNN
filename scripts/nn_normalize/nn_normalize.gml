///@description normallize value into value between -1, 1
///@param val
///@param min
///@param max

return clamp(((argument0 - argument1) / (argument2 - argument1) * 2) - 1, -1, 1);