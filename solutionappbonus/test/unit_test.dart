// Import the test package
import 'package:test/test.dart';

// Define the function to calculate total price
double calculateTotalPrice(List<double> prices) {
  return prices.fold(0, (total, price) => total + price);
}

void main() {
  test('Calculate total price of items in shopping cart', () {
    // Define a list of item prices
    final prices = [10.0, 15.5, 20.0];
    
    // Calculate the total price
    final totalPrice = calculateTotalPrice(prices);
    
    // Verify the result
    expect(totalPrice, 45.5);
  });
}
