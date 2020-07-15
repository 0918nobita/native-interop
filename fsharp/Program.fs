open System.Runtime.InteropServices

[<DllImport("../shared_library/libmylib.so", EntryPoint = "my_func")>]
extern int myFunc()

[<EntryPoint>]
let main _ =
    printfn "%i" <| myFunc ()
    0
