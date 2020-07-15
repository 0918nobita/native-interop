SHARED_LIBRARY := shared_library/libmylib.so
OCAML_EXE := ocaml/main
CSHARP_EXE := csharp/bin/Debug/netcoreapp3.1/native-interop
FSHARP_EXE := fsharp/bin/Debug/netcoreapp3.1/native-interop

TARGET_DEPS := $(SHARED_LIBRARY)
TARGET_DEPS += $(OCAML_EXE)
TARGET_DEPS += $(CSHARP_EXE)
TARGET_DEPS += $(FSHARP_EXE)

all: $(TARGET_DEPS)

$(SHARED_LIBRARY):
	cd shared_library && $(MAKE) libmylib.so

$(OCAML_EXE): $(SHARED_LIBRARY)
	cd ocaml && $(MAKE)

$(CSHARP_EXE): $(SHARED_LIBRARY)
	cd csharp && $(MAKE)

$(FSHARP_EXE): $(SHARED_LIBRARY)
	cd fsharp && $(MAKE)

.PHONY: clean
clean:
	$(MAKE) -C shared_library clean
	$(MAKE) -C ocaml clean
	$(MAKE) -C csharp clean
	$(MAKE) -C fsharp clean

.PHONY: run-ocaml
run-ocaml: $(OCAML_EXE)
	cd ocaml && ./main

.PHONY: run-csharp
run-csharp: $(CSHARP_EXE)
	cd csharp && ./bin/Debug/netcoreapp3.1/native-interop

.PHONY: run-fsharp
run-fsharp: $(FSHARP_EXE)
	cd fsharp && ./bin/Debug/netcoreapp3.1/native-interop

.PHONY: run-racket
run-racket: $(SHARED_LIBRARY)
	racket main.rkt
