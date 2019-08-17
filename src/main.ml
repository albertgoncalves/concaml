(*
 *  https://www.cs.cornell.edu/courses/cs3110/2019sp/textbook/ads/concurrency.html
 *  https://dev.realworldocaml.org/concurrent-programming.html
 *  https://github.com/pusher/websockets-from-scratch-tutorial
 *)

let stdin (() : unit) : string Lwt.t = Lwt_io.read_line Lwt_io.stdin

let pending : unit Lwt.t =
    Lwt.bind (stdin ()) (fun a ->
        Lwt.bind (stdin ()) (fun b ->
            Lwt_io.printf "%s\n" (a ^ b)))

let (_ : 'a) : unit = Lwt_main.run pending
