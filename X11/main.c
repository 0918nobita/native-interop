#include<stdio.h>
#include<X11/Xlib.h>

int main(void) {
    // 画面を管理する Xserver との通信経路を確立する
    Display* display = XOpenDisplay(NULL);

    // 新規ウィンドウの管理を依頼する
    Window window =
        XCreateSimpleWindow(
            display,
            RootWindow(display, 0), // 親ウィンドウの ID
            0, 0,                   // 表示位置 x, y
            512, 512,               // ウィンドウサイズ
            3,                      // 枠線の太さ
            WhitePixel(display, 0), // 枠の色の pixel 番号
            BlackPixel(display, 0)  // ウィンドウの背景色の pixel 番号
        );

    // 他のウィンドウで隠れた状態でも描画内容を記憶するように設定
    XSetWindowAttributes attrs;
    attrs.backing_store = WhenMapped;
    XChangeWindowAttributes(
        display,
        window,
        CWBackingStore, // ビットマスク定数
        &attrs
    );

    XStoreName(display, window, "X11 Application");

    // ウィンドウが表示されるまで待機する
    XEvent event;
    XSelectInput(display, window, ExposureMask);
    XMapWindow(display, window);

    // x ボタンを推しても終了しないようにする
    Atom delWindow = XInternAtom(display, "WM_DELETE_WINDOW", 0);
    XSetWMProtocols(display, window, &delWindow, 1);

    while (1) {
        XNextEvent(display, &event);

        // x ボタンを押された場合
        if (event.type == ClientMessage) break;
    }

    XDestroyWindow(display, window);
    XCloseDisplay(display);

    return 0;
}
