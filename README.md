# Native Interoperability

Call a function from a shared library written in C, from various languages

## Supported platform

- Linux

## Requirements

- GCC or Clang (required for all of the following languages)

| Language | Requirements |
| :--- | :--- |
| C++ | CMake |
| Rust | Cargo 1.43 or later |
| OCaml | OCaml 4.08 or later |
| Haskell | Stack 2.3 or later |
| Java | JDK 14 |
| C# / F# | .NET Core SDK 3.1 or later |
| Python | Python 3.8 or later |
| Racket | Racket 7.2 or later |

## Build

| Target | Build command |
| :--- | :--- |
| All | `make` |
| Dynamic link library | `make dylib` |
| C (executable) | `make c-exe` |
| C++ | `make cpp` |
| Rust | `make rust` |
| OCaml | `make ocaml` |
| Haskell | `make haskell` |
| Java | `make java` |
| C# | `make csharp` |
| F# | `make fsharp` |

## Run

| Language | Run command |
| :--- | :--- |
| C | `make run-c` |
| C++ | `make run-cpp` |
| Rust | `make run-rust` |
| OCaml | `make run-ocaml` |
| Haskell | `make run-haskell` |
| Java | `make run-java` |
| C# | `make run-csharp` |
| F# | `make run-fsharp` |
| Python | `make run-python` |
| Racket | `make run-racket` |

## Clean

```bash
make clean
```
