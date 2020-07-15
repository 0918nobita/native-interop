TARGET_DEPS := shared_library/libmylib.so
TARGET_DEPS += ocaml/main
TARGET_DEPS += csharp/bin/Debug/netcoreapp3.1/native-interop
TARGET_DEPS += fsharp/bin/Debug/netcoreapp3.1/native-interop

all: $(TARGET_DEPS)

shared_library/libmylib.so:
	cd shared_library && $(MAKE) libmylib.so

ocaml/main: shared_library/libmylib.so
	cd ocaml && $(MAKE)

csharp/bin/Debug/netcoreapp3.1/native-interop: shared_library/libmylib.so
	cd csharp && $(MAKE)

fsharp/bin/Debug/netcoreapp3.1/native-interop: shared_library/libmylib.so
	cd fsharp && $(MAKE)

.PHONY: clean
clean:
	$(MAKE) -C shared_library clean
	$(MAKE) -C ocaml clean
	$(MAKE) -C csharp clean
	$(MAKE) -C fsharp clean

.PHONY: run-ocaml
run-ocaml: ocaml/main
	cd ocaml && ./main

.PHONY: run-csharp
run-csharp: csharp/bin/Debug/netcoreapp3.1/native-interop
	cd csharp && ./bin/Debug/netcoreapp3.1/native-interop

.PHONY: run-fsharp
run-fsharp: fsharp/bin/Debug/netcoreapp3.1/native-interop
	cd fsharp && ./bin/Debug/netcoreapp3.1/native-interop
