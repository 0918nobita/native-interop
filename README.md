# Native Interoperability

Call a function from a shared library written in C, from C#, F#, OCaml and Racket

## Supported platform

- Linux

## Requirements

- GCC or Clang
- .NET Core SDK 3.1 or later
- OCaml 4.08 or later
- Racket 7.2 or later

## Build

```bash
make
```

## Run

| Language | Run command |
| :--- | :--- |
| C# | `make run-csharp` |
| F# | `make run-fsharp` |
| OCaml | `make run-ocaml` |
| Racket | `make run-racket` |

## Clean

```bash
make clean
```
