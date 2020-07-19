# Native Interoperability

![Build](https://github.com/0918nobita/native-interop/workflows/Build/badge.svg)

Call a function from a shared library written in C, from various languages

## Supported platform

- Linux

## Requirements

- GCC or Clang (required for all of the following languages)

| Language | Requirements |
| :--- | :--- |
| C (executable) / C++ | CMake 3.5 or later |
| Rust | Cargo 1.43 or later |
| OCaml | OCaml 4.08 or later |
| Go | Go 1.14 or later |
| Haskell | Stack 2.3 or later |
| Kotlin/Native | kotlin-native-linux 1.3.72 |
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
| Go | `make go` |
| OCaml | `make ocaml` |
| Haskell | `make haskell` |
| Kotlin/Native | `make kotlin` |
| Java | `make java` |
| C# | `make csharp` |
| F# | `make fsharp` |

## Run

| Language | Run command |
| :--- | :--- |
| C | `make run-c` |
| C++ | `make run-cpp` |
| Rust | `make run-rust` |
| Go | `make run-go` |
| OCaml | `make run-ocaml` |
| Haskell | `make run-haskell` |
| Kotlin/Native | `make run-kotlin` |
| Java | `make run-java` |
| C# | `make run-csharp` |
| F# | `make run-fsharp` |
| Python | `python main.py` |
| Racket | `racket main.rkt` |

## Clean

```bash
make clean
```
