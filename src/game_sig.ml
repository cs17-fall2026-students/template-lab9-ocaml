module type Game = sig

  (* this specifies a player -- which player won, which player's 
     turn it is, etc. *)

  type which_player =
    | P1
    | P2

  (* represents the status of the game: 
     if it's over, who won,
     whose turn it is, if it isn't *)
  type status = 
    | Win of which_player
    | Draw
    | Ongoing of which_player

  (* expresses the state of the game,
     i.e., what the board looks like, whose turn it is,
     or anything else associated with a game at a given turn *)
  type state 

  (* describes a game's moves that a player can make *)
  type move

  (* the state of the game when it begins *)
  val initial_state: string -> state

  (* produce the set of legal moves at a state, represented as a list *)
  val legal_moves: state -> move list

  (* returns the status of the game at the given state *)
  val game_status: state -> status

  (* given a state and a legal move, yields the next state *)
  val next_state: state * move -> state

  (* returns the current player of the game *)
  val current_player: state -> which_player

  (* given a state, calculate the best next move *)
  val calculate_best_move: state -> move

  (* TODO: add the additional signatures here *)

end