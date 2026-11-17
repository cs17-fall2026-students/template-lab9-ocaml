(* TODO: update R1 to use Nim instead of Go_first! *)
module R1 =
  Src.Referee.Make (Go_first.Game) (Src.Human_player.Make (Go_first.Game))
    (Src.Human_player.Make (Go_first.Game));;

R1.play_game "";;
