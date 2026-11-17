open Src.Game_sig

(* TODO: Write your implementation of Nim here! *)

module Nim = struct
  type which_player =
    | P1
    | P2

  type status =
    | Win of which_player
    | Draw
    | Ongoing of which_player

  type state =  ...

  type move = ... 

  let initial_state: string -> state = function _ -> failwith("not implemented")

  let legal_moves: state -> move list = function _ -> failwith("not implemented")

  let game_status: state -> status = function _ -> failwith("not implemented")

  let other_player: which_player -> which_player = function _ -> failwith("not implemented")

  let next_state = function _ -> failwith("not implemented")

  let current_player = function _ -> failwith("not implemented")

  let calculate_best_move = function _ -> failwith("not implemented")

  let string_of_player = function _ -> failwith("not implemented")

  let string_of_state = function _ -> failwith("not implemented")

  let string_of_move = function _ -> failwith("not implemented")

  let move_of_string = function _ -> failwith("not implemented")
end