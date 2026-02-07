/// Module containing basic mathematical functions
pub mod calculator {
    /// Adds two numbers
    ///
    /// # Examples
    /// ```
    /// use rust_sample::calculator::add;
    /// assert_eq!(add(2, 3), 5);
    /// ```
    pub fn add(a: i32, b: i32) -> i32 {
        a + b
    }

    /// Subtracts two numbers
    pub fn subtract(a: i32, b: i32) -> i32 {
        a - b
    }

    /// Multiplies two numbers
    pub fn multiply(a: i32, b: i32) -> i32 {
        a * b
    }

    /// Divides two numbers
    ///
    /// # Panics
    /// Panics if the divisor is 0
    pub fn divide(a: i32, b: i32) -> Result<f64, String> {
        if b == 0 {
            return Err("Cannot divide by zero".to_string());
        }
        Ok(a as f64 / b as f64)
    }
}

#[cfg(test)]
mod tests {
    use super::calculator::*;

    #[test]
    fn test_add() {
        assert_eq!(add(2, 3), 5);
        assert_eq!(add(-1, 1), 0);
        assert_eq!(add(0, 0), 0);
    }

    #[test]
    fn test_subtract() {
        assert_eq!(subtract(5, 3), 2);
        assert_eq!(subtract(0, 5), -5);
        assert_eq!(subtract(-3, -3), 0);
    }

    #[test]
    fn test_multiply() {
        assert_eq!(multiply(3, 4), 12);
        assert_eq!(multiply(-2, 3), -6);
        assert_eq!(multiply(0, 100), 0);
    }

    #[test]
    fn test_divide() {
        assert_eq!(divide(10, 2).unwrap(), 5.0);
        assert_eq!(divide(7, 2).unwrap(), 3.5);
        assert!(divide(5, 0).is_err());
    }

    #[test]
    fn test_divide_by_zero() {
    let result = divide(10, 0);
    assert!(result.is_err());
    assert_eq!(result.unwrap_err(), "Cannot divide by zero");
    }
}
