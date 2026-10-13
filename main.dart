double calculateTotalCost(int quantity, double price, bool isStudent) {
  double total = 0.0;

  for (int i = 0; i < quantity; i++) {
    total += price;
  }

  if (isStudent) {
    total *= 0.90;
    print('Student discount applied (10% off)!');
  } else {
    print('Standard rate applied.');
  }

  return total;
}

void main() {
  String studentName = 'Nathaniel';
  double price = 50.00;
  bool isStudent = true;
  double startingMoney = 200.00;

  String rawInput = 'abc';

  print('Student: $studentName');
  print('---------------------------');
  print('Entered quantity: $rawInput');

  try {
    int quantity = int.parse(rawInput);

    if (quantity < 0) {
      throw FormatException('Quantity cannot be negative.');
    }

    double total = calculateTotalCost(quantity, price, isStudent);
    double remainingMoney = startingMoney - total;
    bool canBuy = total <= startingMoney;
    int itemsLeft = 10 % (quantity == 0 ? 1 : quantity);

    print('Price per item: ₱${price.toStringAsFixed(2)}');
    print('Total cost: ₱${total.toStringAsFixed(2)}');
    print('Remaining money: ₱${remainingMoney.toStringAsFixed(2)}');
    print('Can buy the items? $canBuy');
    print('Items left after grouping: $itemsLeft');

    if (canBuy) {
      print('Status: Purchase successful!');
    } else {
      print('Status: Insufficient funds.');
    }
  } on FormatException {
    print('---------------------------');
    print('Error: Invalid quantity!');
    print('Please enter a whole number greater than or equal to 0.');
  } catch (e) {
    print('Unexpected error: $e');
  }
}
