open Game_sig

module type Player = sig
  module PlayerGame : Game
  val next_move : PlayerGame.state -> PlayerGame.move
end