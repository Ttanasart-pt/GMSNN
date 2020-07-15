///@description game_point
///@param game

var game = argument0;

#region reset
	with(game.agent){
		event_user(1);	
	}
#endregion

game.game_round++;

if(game.game_round >= o_main.game_len){
	game_finish(game);
}