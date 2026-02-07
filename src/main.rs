use rust_sample::calculator;

fn main() {
    println!("🦀 Welcome to Rust Sample Calculator!");
    println!("========================================");

    // Usage examples
    let a = 10;
    let b = 5;

    println!("\nOperations with {} and {}:", a, b);
    println!("Addition: {} + {} = {}", a, b, calculator::add(a, b));
    println!(
        "Subtraction: {} - {} = {}",
        a,
        b,
        calculator::subtract(a, b)
    );
    println!(
        "Multiplication: {} × {} = {}",
        a,
        b,
        calculator::multiply(a, b)
    );

    match calculator::divide(a, b) {
        Ok(result) => println!("Division: {} ÷ {} = {:.2}", a, b, result),
        Err(e) => println!("Error: {}", e),
    }

    // Example of division by zero
    println!("\nWhat happens if we divide by zero?");
    match calculator::divide(a, 0) {
        Ok(result) => println!("Result: {}", result),
        Err(e) => println!("Caught error: {}", e),
    }

    println!("\n✅ Program finished successfully!");
}
