# Useful Commands for the Project

## 🔨 Development

### Build and run
```bash
cargo run
```

### Build without running
```bash
cargo build
```

### Build in release mode (optimized)
```bash
cargo build --release
```

### Check code without building
```bash
cargo check
```

## 🧪 Testing

### Run all tests
```bash
cargo test
```

### Run tests with detailed output
```bash
cargo test -- --nocapture
```

### Run a specific test
```bash
cargo test test_add
```

### Run tests in verbose mode
```bash
cargo test --verbose
```

## 🎨 Linting and Formatting

### Format code
```bash
cargo fmt
```

### Check formatting without modifying
```bash
cargo fmt -- --check
```

### Run clippy (linter)
```bash
cargo clippy
```

### Clippy with all warnings as errors
```bash
cargo clippy -- -D warnings
```

## 📚 Documentation

### Generate documentation
```bash
cargo doc
```

### Generate and open documentation in browser
```bash
cargo doc --open
```

## 🧹 Cleaning

### Clean compiled files
```bash
cargo clean
```

## 🔍 Information

### View dependency tree
```bash
cargo tree
```

### Update dependencies
```bash
cargo update
```

### Check Rust and Cargo version
```bash
rustc --version
cargo --version
```

## 🚀 Git & GitHub

### Initialize repository
```bash
git init
git add .
git commit -m "Initial commit"
```

### Connect to GitHub
```bash
git remote add origin https://github.com/cazofeifacr/rust-sample.git
git branch -M main
git push -u origin main
```

### Push changes
```bash
git add .
git commit -m "Description of the changes"
git push
```

## 📊 CI/CD

The GitHub Actions pipeline runs automatically on push/PR.
To see the results:
1. Go to your repository on GitHub
2. Click on the "Actions" tab
3. Select the workflow run you want to view
