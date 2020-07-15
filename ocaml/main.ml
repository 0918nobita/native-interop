external my_func: unit -> int = "my_func"

let () =
    let status = my_func () in
    print_endline @@ string_of_int status
