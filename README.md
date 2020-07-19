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
| Java | JDK 14 |
| C# / F# | .NET Core SDK 3.1 or later |
| Python | Python 3.8 or later |
| Racket | Racket 7.2 or later |

## Build

| Target | Build command |
| :--- | :--- |
| All | `make` |
| DLL, C (executable), C++  | `make dylib-c-cpp` |
| Rust | `make rs` |
| Go | `make go` |
| OCaml | `make ml` |
| Haskell | `make hs` |
| Java | `make java` |
| C# | `make cs` |
| F# | `make fs` |

## Run

| Language | Run command |
| :--- | :--- |
| C | `make run-c` |
| C++ | `make run-cpp` |
| Rust | `make run-rs` |
| Go | `make run-go` |
| OCaml | `make run-ml` |
| Haskell | `make run-hs` |
| Java | `make run-java` |
| C# | `make run-cs` |
| F# | `make run-fs` |
| Python | `make run-py` |
| Racket | `make run-rkt` |

## Clean

```bash
make clean
```
