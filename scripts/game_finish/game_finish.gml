///@description game_finish
var game = argument0;

game.game_round = 0;
with(o_main){
	game_done = game;
	event_user(10);
}