open Game_sig

module Make (MyGame: Game) = struct
  module PlayerGame = MyGame

  let next_move: PlayerGame.state -> PlayerGame.move = function s -> 
    let m = PlayerGame.calculate_best_move s in 
    let lm = PlayerGame.legal_moves s in 
    if List.mem m lm then m else List.hd lm 
end