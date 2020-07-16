package vision.kodai.jni;

import com.sun.jna.Library;
import com.sun.jna.Native;

class Main {
    private interface MyLib extends Library {
        MyLib INSTANCE =
            (MyLib) Native.synchronizedLibrary(Native.load("mylib", MyLib.class));

        void my_func();
    }

    public static void main(String[] args) {
        MyLib.INSTANCE.my_func();
    }
}
