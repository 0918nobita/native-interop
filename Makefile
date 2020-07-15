all: shared_library/libmylib.so ocaml/main csharp/bin/Debug/netcoreapp3.1/native-interop

shared_library/libmylib.so:
	cd shared_library && $(MAKE) libmylib.so

ocaml/main: shared_library/libmylib.so
	cd ocaml && $(MAKE)

csharp/bin/Debug/netcoreapp3.1/native-interop: shared_library/libmylib.so
	cd csharp && $(MAKE)

PHONY: clean
clean:
	$(MAKE) -C shared_library clean
	$(MAKE) -C ocaml clean
	$(MAKE) -C csharp clean

PHONY: run-ocaml
run-ocaml: ocaml/main
	cd ocaml && ./main

PHONY: run-csharp
run-csharp: csharp/bin/Debug/netcoreapp3.1/native-interop
	cd csharp && ./bin/Debug/netcoreapp3.1/native-interop
