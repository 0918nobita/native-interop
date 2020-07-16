SHARED_LIBRARY := shared_library/libmylib.so
C_EXE := shared_library/main
CPP_EXE := cpp/build/main
OCAML_EXE := ocaml/main
CSHARP_EXE := csharp/bin/Debug/netcoreapp3.1/native-interop
FSHARP_EXE := fsharp/bin/Debug/netcoreapp3.1/native-interop

TARGET_DEPS := $(SHARED_LIBRARY)
TARGET_DEPS += $(C_EXE)
TARGET_DEPS += $(CPP_EXE)
TARGET_DEPS += $(OCAML_EXE)
TARGET_DEPS += $(CSHARP_EXE)
TARGET_DEPS += $(FSHARP_EXE)

all: $(TARGET_DEPS) rust

.PHONY: dylib
dylib: $(SHARED_LIBRARY)

.PHONY: c-exe
c-exe: $(C_EXE)

.PHONY: cpp
cpp: $(CPP_EXE)

.PHONY: rust
rust: $(SHARED_LIBRARY)
	cd rust && cargo build

.PHONY: ocaml
ocaml: $(OCAML_EXE)

.PHONY: haskell
haskell: $(SHARED_LIBRARY)
	cd haskell && stack build

.PHONY: java
java: $(SHARED_LIBRARY)
	cd java && ./gradlew build

.PHONY: csharp
csharp: $(CSHARP_EXE)

.PHONY: fsharp
fsharp: $(FSHARP_EXE)

$(SHARED_LIBRARY):
	cd shared_library && $(MAKE) libmylib.so

$(C_EXE): $(SHARED_LIBRARY)
	cd shared_library && $(MAKE) main

$(CPP_EXE): $(SHARED_LIBRARY)
	cd cpp && mkdir -p build && cd build && cmake .. && cmake --build .

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
	cd rust && cargo clean
	rm -rf cpp/build
	rm -rf haskell/.stack-work

.PHONY: run-c
run-c:
	cd shared_library && ./main

.PHONY: run-cpp
run-cpp: $(CPP_EXE)
	./cpp/build/main

.PHONY: run-rust
run-rust: $(SHARED_LIBRARY)
	cd rust && LD_LIBRARY_PATH=$LD_LIBRARY_PATH:../shared_library cargo run

.PHONY: run-ocaml
run-ocaml: $(OCAML_EXE)
	cd ocaml && ./main

.PHONY: run-haskell
run-haskell: $(SHARED_LIBRARY)
	cd haskell && LD_LIBRARY_PATH=$LD_LIBRARY_PATH:../shared_library stack run

.PHONY: run-java
run-java: $(SHARED_LIBRARY)
	cd java && ./gradlew run

.PHONY: run-csharp
run-csharp: $(CSHARP_EXE)
	cd csharp && ./bin/Debug/netcoreapp3.1/native-interop

.PHONY: run-fsharp
run-fsharp: $(FSHARP_EXE)
	cd fsharp && ./bin/Debug/netcoreapp3.1/native-interop

.PHONY: run-python
run-python: $(SHARED_LIBRARY)
	python main.py

.PHONY: run-racket
run-racket: $(SHARED_LIBRARY)
	racket main.rkt
