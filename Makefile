DYLIB := build/dylib/libmylib.so
GO_EXE := go/main
OCAML_EXE := ocaml/main
KT_EXE := kotlin/main.kexe
CSHARP_EXE := csharp/bin/Debug/netcoreapp3.1/native-interop
FSHARP_EXE := fsharp/bin/Debug/netcoreapp3.1/native-interop

TARGET_DEPS := $(DYLIB)
TARGET_DEPS += $(GO_EXE)
TARGET_DEPS += $(OCAML_EXE)
TARGET_DEPS += $(KT_EXE)
TARGET_DEPS += $(CSHARP_EXE)
TARGET_DEPS += $(FSHARP_EXE)

all: $(TARGET_DEPS) rust haskell java

.PHONY: dylib-c-cpp
dylib-c-cpp:
	mkdir -p build && cd build && cmake .. -G Ninja && ninja

.PHONY: rs
rs: $(DYLIB)
	cd rust && cargo build

.PHONY: go
go: $(GO_EXE)

.PHONY: ml
ml: $(OCAML_EXE)

.PHONY: hs
hs: $(DYLIB)
	cd haskell && stack build

.PHONY: kt
kt: $(KT_EXE)

.PHONY: java
java: $(DYLIB)
	cd java && ./gradlew build

.PHONY: cs
cs: $(CSHARP_EXE)

.PHONY: fs
fs: $(FSHARP_EXE)

$(DYLIB):
	mkdir -p build && cd build && cmake .. -G Ninja && ninja

$(GO_EXE): $(DYLIB) go/main.go
	cd go && go build main.go

$(OCAML_EXE): $(DYLIB)
	cd ocaml && $(MAKE)

$(KT_EXE): $(DYLIB)
	cd kotlin && $(MAKE)

$(CSHARP_EXE): $(DYLIB)
	cd csharp && $(MAKE)

$(FSHARP_EXE): $(DYLIB)
	cd fsharp && $(MAKE)

.PHONY: clean
clean:
	rm -rf build
	cd rust && cargo clean
	rm -f go/main
	$(MAKE) -C ocaml clean
	rm -rf haskell/.stack-work
	$(MAKE) -C kotlin clean
	rm -rf java/.gradle java/build
	$(MAKE) -C csharp clean
	$(MAKE) -C fsharp clean

.PHONY: run-c
run-c: dylib-c-cpp
	./build/c/main-c

.PHONY: run-cpp
run-cpp: dylib-c-cpp
	./build/cpp/main-cpp

.PHONY: run-rs
run-rs: $(DYLIB)
	cd rust && LD_LIBRARY_PATH=$LD_LIBRARY_PATH:../build/dylib cargo run

.PHONY: run-go
run-go: $(GO_EXE)
	cd go && LD_LIBRARY_PATH=$LD_LIBRARY_PATH:../build/dylib ./main

.PHONY: run-ml
run-ml: $(OCAML_EXE)
	cd ocaml && LD_LIBRARY_PATH=$LD_LIBRARY_PATH:../build/dylib ./main

.PHONY: run-hs
run-hs: $(DYLIB)
	cd haskell && LD_LIBRARY_PATH=$LD_LIBRARY_PATH:../build/dylib stack run

.PHONY: run-kt
run-kt: $(KT_EXE)
	cd kotlin && LD_LIBRARY_PATH=$LD_LIBRARY_PATH:../build/dylib ./main.kexe

.PHONY: run-java
run-java: $(DYLIB)
	cd java && ./gradlew run

.PHONY: run-cs
run-cs: $(CSHARP_EXE)
	cd csharp && ./bin/Debug/netcoreapp3.1/native-interop

.PHONY: run-fs
run-fs: $(FSHARP_EXE)
	cd fsharp && ./bin/Debug/netcoreapp3.1/native-interop

.PHONY: run-py
run-py: $(DYLIB)
	python ./main.py

.PHONY: run-rkt
run-rkt: $(DYLIB)
	racket ./main.rkt
