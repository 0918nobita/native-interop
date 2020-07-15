# Native Interoperability

Call a function from a shared library written in C, from C, Rust, OCaml C#, F# and Racket

## Supported platform

- Linux

## Requirements

- GCC or Clang
- .NET Core SDK 3.1 or later
- OCaml 4.08 or later
- Rust
- Racket 7.2 or later

## Build

| Target | Build command |
| :--- | :--- |
| All | `make` |
| Dynamic link library | `make dylib` |
| C (executable) | `make c-exe` |
| Rust | `make rust` |
| OCaml | `make ocaml` |
| C# | `make csharp` |
| F# | `make fsharp` |

## Run

| Language | Run command |
| :--- | :--- |
| C | `make run-c` |
| Rust | `make run-rust` |
| OCaml | `make run-ocaml` |
| C# | `make run-csharp` |
| F# | `make run-fsharp` |
| Racket | `make run-racket` |

## Clean

```bash
make clean
```
