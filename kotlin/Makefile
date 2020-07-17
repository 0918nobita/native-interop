main.kexe: Main.kt myLib.klib
	kotlinc-native -l myLib -o main Main.kt

myLib.klib: MyLib.def
	cinterop -def MyLib.def -o myLib

.PHONY: clean
clean:
	rm -rf myLib-build main.kexe myLib.klib
