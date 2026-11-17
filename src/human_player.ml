open Game_sig

module Make (MyGame : Game) = struct
  module PlayerGame = MyGame

  let get_input_line () : string =
    print_string "What move do you want to make? ";
    flush stdout;
    input_line stdin

  let rec next_move s =
    match get_input_line () with 
     | "exit" -> print_endline "Exiting Game REPL"; exit 0
     | input ->
       let mov = PlayerGame.move_of_string (input, s) in
       if List.mem mov (PlayerGame.legal_moves s) then mov
       else 
        (print_endline "Illegal move."; next_move s)
end
