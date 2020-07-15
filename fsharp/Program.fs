open System.Runtime.InteropServices

module private Native =
    [<DllImport("../shared_library/libmylib.so", EntryPoint = "my_func")>]
    extern int myFunc()

[<EntryPoint>]
let main _ =
    printfn "%i" <| Native.myFunc ()
    0
