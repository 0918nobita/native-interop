#[link(name = "mylib")]
extern "C" {
    fn my_func() -> isize;
}

fn main() {
    let status = unsafe { my_func() };
    println!("{}", status);
}
