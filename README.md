
# Rust Sample Project 🦀

A minimal Rust calculator example with CI/CD.

## Features
- Add, subtract, multiply, divide (with error handling)
- Unit tests
- Automated CI/CD (GitHub Actions)

## Quick Start
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

## Example
```rust
use rust_sample::calculator;

fn main() {
    let sum = calculator::add(2, 2);
    println!("2 + 2 = {}", sum);
}
```

## Contributing
Fork, branch, commit, and open a PR.

## License
MIT
