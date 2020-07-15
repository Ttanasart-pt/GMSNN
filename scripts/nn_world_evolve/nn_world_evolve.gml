///@description Start new generation
///call when end generation, reset fittess

with(global.__nn__object){
	__nn__offspring = 0;
	
	__nn__generation++;
	for(var i=0; i<__nn__players; i++){
		__nn__max_fitness[i] = -999;
	}
}