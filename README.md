
# Rust Sample Project 🦀

[![Rust CI/CD](https://github.com/cazofeifacr/rust-sample/actions/workflows/ci.yml/badge.svg)](https://github.com/cazofeifacr/rust-sample/actions/workflows/ci.yml)

A simple Rust project demonstrating best practices, including unit tests and CI/CD with GitHub Actions.

## 📋 Description

This project implements a basic calculator with the following operations:
- ✅ Addition
- ➖ Subtraction
- ✖️ Multiplication
- ➗ Division (with error handling)

## 🚀 Getting Started

### Prerequisites

- [Rust](https://www.rust-lang.org/tools/install) (version 1.70 or higher)
- Cargo (included with Rust)

### Installation

1. Clone the repository:
```bash
git clone https://github.com/cazofeifacr/rust-sample.git
cd rust-sample
```

2. Build the project:
```bash
cargo build
```

3. Run the project:
```bash
cargo run
```

## 🧪 Tests

Run all tests:
```bash
cargo test
```

Run tests with detailed output:
```bash
cargo test -- --nocapture
```

View test coverage:
```bash
cargo test --verbose
```

## 📦 Build

Build in release mode (optimized):
```bash
cargo build --release
```

The binary will be generated in `target/release/rust-sample`

## 🔧 Project Structure

```
rust-sample/
├── src/
│   ├── lib.rs          # Library with calculator module
│   └── main.rs         # Application entry point
├── .github/
│   └── workflows/
│       └── ci.yml      # CI/CD pipeline
├── Cargo.toml          # Project configuration
└── README.md           # This file
```

## 🔄 CI/CD

The project uses GitHub Actions for CI/CD with three main jobs:

1. **Test**: Runs all unit tests
2. **Build**: Builds the project in release mode
3. **Lint**: Checks code formatting with rustfmt and clippy

The pipeline runs automatically on:
- Push to `main` or `master` branches
- Pull requests to `main` or `master` branches

## 📚 Using the Calculator Module

```rust
use rust_sample::calculator;

fn main() {
    // Addition
    let result = calculator::add(5, 3);
    println!("5 + 3 = {}", result);
    
    // Division with error handling
    match calculator::divide(10, 2) {
        Ok(result) => println!("10 / 2 = {}", result),
        Err(e) => println!("Error: {}", e),
    }
}
```

## 🤝 Contributing

Contributions are welcome. Please:

1. Fork the project
2. Create a branch for your feature (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## ✨ Author

Your Name - [@cazofeifacr](https://github.com/cazofeifacr)

## 🙏 Acknowledgments

- Rust Community
- GitHub Actions
- All contributors
