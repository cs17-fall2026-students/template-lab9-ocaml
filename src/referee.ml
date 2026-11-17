open Game_sig
open Player_sig

module Make
    (MyGame : Game)
    (Player1 : Player with module PlayerGame = MyGame)
    (Player2 : Player with module PlayerGame = MyGame) =
struct
  module CurrentGame = MyGame

  let play_game : string -> unit =
   fun str ->
    let rec game_loop : CurrentGame.state -> unit =
     fun s ->
      print_endline (CurrentGame.string_of_state s);
      match CurrentGame.game_status s with
      | CurrentGame.Win player ->
          print_endline (CurrentGame.string_of_player player ^ " wins!")
      | CurrentGame.Draw -> print_endline "Draw..."
      | CurrentGame.Ongoing player ->
          print_endline (CurrentGame.string_of_player player ^ "'s turn.");
          let next =
            try
              let the_move =
                match player with
                | CurrentGame.P1 -> Player1.next_move s
                | CurrentGame.P2 -> Player2.next_move s
              in
              print_endline
                (CurrentGame.string_of_player player
                ^ " makes the move "
                ^ CurrentGame.string_of_move the_move);
              CurrentGame.next_state (s, the_move)
            with Failure message ->
              print_endline message;
              s
          in
          game_loop next
    in
    game_loop (CurrentGame.initial_state str)
end
