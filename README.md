# Rust Sample Project 🦀

A minimal Rust calculator example with CI/CD. Published on [crates.io](https://crates.io/crates/rust_sample_calc_cazofeifa).

## Features
- Add, subtract, multiply, divide (with error handling)
- Unit tests
- Automated CI/CD (GitHub Actions)

## Usage as a Library

Add to your `Cargo.toml`:

```toml
[dependencies]
rust_sample_calc_cazofeifa = "0.0.1"
```

Then in your code:

```rust
use rust_sample_calc_cazofeifa::calculator;

fn main() {
    println!("{}", calculator::add(2, 3));       // 5
    println!("{:?}", calculator::divide(10, 3)); // Ok(3.333...)
}
```

## Install as a Binary (CLI)

To run the calculator from the terminal:

```bash
cargo install rust_sample_calc_cazofeifa
rust-sample
```

## Quick Start (from source)
1. Install [Rust](https://www.rust-lang.org/tools/install)
2. Clone:
   ```bash
   git clone https://github.com/cazofeifacr/rust-sample.git
   cd rust-sample
   ```
3. Build & run:
   ```bash
   cargo build
   cargo run
   ```
4. Test:
   ```bash
   cargo test
   ```

## Contributing
Fork, branch, commit, and open a PR.

## License
MIT
