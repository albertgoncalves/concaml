(*
 *  https://www.cs.cornell.edu/courses/cs3110/2019sp/textbook/ads/concurrency.html
 *  https://dev.realworldocaml.org/concurrent-programming.html
 *  https://caml.inria.fr/pub/docs/oreilly-book/html/book-ora186.html
 *)

let promise (() : unit) : string Lwt.t = Lwt_io.read_line Lwt_io.stdin

let rec async (() : unit) : unit Lwt.t = Lwt.bind (promise ()) callback

and callback (x : string) : unit Lwt.t =
    let _ : unit Lwt.t = async () in
    Unix.sleep 1;
    Lwt_io.printf "\t%s\n" x

let (_ : 'a) : unit =
    while true do
        async () |> Lwt_main.run
    done
