///@description array_duplicate_2D
///@param source

var arr = argument0;
var _arr = 0;

for(var i=0; i<array_height_2d(arr); i++){
	for(var j=0; j<array_length_2d(arr, i); j++){
		_arr[i, j] = arr[i, j];
	}
}

return _arr;