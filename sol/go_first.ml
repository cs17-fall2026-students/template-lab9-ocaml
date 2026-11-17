open Src.Game_sig

module Go_firstI = struct
  type which_player =
    | P1
    | P2

  type status =
    | Win of which_player
    | Draw
    | Ongoing of which_player

  type state =
    | State of status * bool

  type move =
    | Move of bool

  let current_player: state -> which_player = function
    | State (Draw, _) -> failwith ""
    | State (Ongoing p, _)
    | State (Win p, _) -> p

  let other_player: which_player -> which_player = function
    | P1 -> P2
    | P2 -> P1

  let initial_state : string -> state = function _ -> 
    State (Ongoing P1, false)

  let game_status: state -> status = function (State (p, _)) -> p

  let next_state: state * move -> state = function (in_state, mv) -> 
    match (in_state, mv) with
    | (State (Win _, _), _)
    | (State (Draw, _), _) -> in_state
    | (State (Ongoing player, _), Move true) -> State (Win player, true)
    | (State (Ongoing player, _), Move false) ->
      State (Ongoing (other_player player), false)

  let legal_moves: state -> move list = function
    | State (_, true) -> []
    | State (_, false) -> [ Move true; Move false ]

  let calculate_best_move: state -> move = function _ -> Move true

  let string_of_player: which_player -> string = function
    | P1 -> "P1"
    | P2 -> "P2"

  let string_of_state: state -> string = function
    | State (Win _, _) -> "The game is over."
    | State (Ongoing _, _) -> "The game is ongoing."
    | State (Draw, _) -> "The game is a draw."

  let string_of_move: move -> string = function (Move b) -> 
    if b then "Go" else "Pass!"

  let move_of_string: string * state -> move = function (str, _) -> 
    match str with
    | "go" -> Move true
    | "pass" -> Move false
    | _ -> failwith "Not a legal move -- please choose \"go\" or \"pass\"!"
end

(* Now, we can make our GoFirst module abstract.
 * This is the module you'll use in play.ml *)
module Game : Game = Go_firstI