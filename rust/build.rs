use std::env;

fn main() {
    let manifest_dir = env::var("CARGO_MANIFEST_DIR").unwrap();
    println!("cargo:rustc-link-search={}/../dylib", manifest_dir);
}
