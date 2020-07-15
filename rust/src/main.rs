#[link(name = "mylib")]
extern {
    fn my_func() -> isize;
}

fn main() {
    let status = unsafe { my_func() };
    println!("{}", status);
}
