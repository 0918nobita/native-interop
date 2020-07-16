# Native Interoperability

Call a function from a shared library written in C, from various languages

## Supported platform

- Linux

## Requirements

- GCC or Clang (required for all of the following languages)

| Language | Requirements |
| :--- | :--- |
| C++ | CMake |
| C# / F# | .NET Core SDK 3.1 or later |
| Java | JDK 14, Gradle |
| OCaml | OCaml 4.08 or later |
| Rust | Cargo 1.43 or later |
| Python | Python 3.8 or later |
| Racket | Racket 7.2 or later |

## Build

| Target | Build command |
| :--- | :--- |
| All | `make` |
| Dynamic link library | `make dylib` |
| C (executable) | `make c-exe` |
| C++ | `make cpp` |
| Java | `make java` |
| Rust | `make rust` |
| OCaml | `make ocaml` |
| C# | `make csharp` |
| F# | `make fsharp` |

## Run

| Language | Run command |
| :--- | :--- |
| C | `make run-c` |
| C++ | `make run-cpp` |
| Java | `make run-java` |
| Rust | `make run-rust` |
| OCaml | `make run-ocaml` |
| C# | `make run-csharp` |
| F# | `make run-fsharp` |
| Python | `make run-python` |
| Racket | `make run-racket` |

## Clean

```bash
make clean
```
