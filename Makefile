SHARED_LIBRARY := shared_library/libmylib.so
C_EXE := c/build/main
CPP_EXE := cpp/build/main
OCAML_EXE := ocaml/main
KT_EXE := kotlin/main.kexe
CSHARP_EXE := csharp/bin/Debug/netcoreapp3.1/native-interop
FSHARP_EXE := fsharp/bin/Debug/netcoreapp3.1/native-interop

TARGET_DEPS := $(SHARED_LIBRARY)
TARGET_DEPS += $(C_EXE)
TARGET_DEPS += $(CPP_EXE)
TARGET_DEPS += $(OCAML_EXE)
TARGET_DEPS += $(KT_EXE)
TARGET_DEPS += $(CSHARP_EXE)
TARGET_DEPS += $(FSHARP_EXE)

all: $(TARGET_DEPS) rust haskell java

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

.PHONY: kotlin
kotlin: $(KT_EXE)

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
	cd c && mkdir -p build && cd build && cmake .. && cmake --build .

$(CPP_EXE): $(SHARED_LIBRARY)
	cd cpp && mkdir -p build && cd build && cmake .. && cmake --build .

$(OCAML_EXE): $(SHARED_LIBRARY)
	cd ocaml && $(MAKE)

$(KT_EXE): $(SHARED_LIBRARY)
	cd kotlin && $(MAKE)

$(CSHARP_EXE): $(SHARED_LIBRARY)
	cd csharp && $(MAKE)

$(FSHARP_EXE): $(SHARED_LIBRARY)
	cd fsharp && $(MAKE)

.PHONY: clean
clean:
	$(MAKE) -C shared_library clean
	rm -rf c/build
	rm -rf cpp/build
	cd rust && cargo clean
	$(MAKE) -C ocaml clean
	rm -rf haskell/.stack-work
	$(MAKE) -C kotlin clean
	rm -rf java/.gradle java/build
	$(MAKE) -C csharp clean
	$(MAKE) -C fsharp clean

.PHONY: run-c
run-c: $(C_EXE)
	cd c/build && ./main

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

.PHONY: run-kotlin
run-kotlin: $(KT_EXE)
	cd kotlin && LD_LIBRARY_PATH=$LD_LIBRARY_PATH:../shared_library ./main.kexe

.PHONY: run-java
run-java: $(SHARED_LIBRARY)
	cd java && ./gradlew run

.PHONY: run-csharp
run-csharp: $(CSHARP_EXE)
	cd csharp && ./bin/Debug/netcoreapp3.1/native-interop

.PHONY: run-fsharp
run-fsharp: $(FSHARP_EXE)
	cd fsharp && ./bin/Debug/netcoreapp3.1/native-interop
