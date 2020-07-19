plugins {
    java
    application
}

repositories {
    mavenCentral()
}

dependencies {
    implementation("net.java.dev.jna:jna:5.6.0")
    implementation("net.java.dev.jna:jna-platform:5.6.0")
}

application {
    mainClassName = "vision.kodai.jni.Main"
}

tasks.withType(JavaExec::class) {
    systemProperty("jna.library.path", file("../dylib").absolutePath)
}
