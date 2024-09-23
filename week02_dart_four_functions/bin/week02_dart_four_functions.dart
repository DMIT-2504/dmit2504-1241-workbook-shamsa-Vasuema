import 'dart:io';


void main(List<String> arguments) {
//   Write a program to tally up total change from user’s pockets. The method GetTotal() will have
// number of pennies, nickels, dimes, quarters, loonies and twoonies passed into it and will return the
// total amount. All values entered must be integers and positive. Validation is required to ensure a
// negative value is not allowed

  print("Enter the number of pennies");
  int pennies = validateInput();

  print("Enter the number of nickels");
  int nickels = validateInput();

  print("Enter the number of dimes");
  int dimes = validateInput();

  print("Enter the number of quarters");
  int quarters = validateInput();

  print("Enter the number of loonies");
  int loonies = validateInput();

  print("Enter the number of toonies");
  int toonies = validateInput();

  double total = getTotal(pennies, nickels, dimes, quarters, loonies, toonies);
  print('Total value is: $total');
}

int validateInput() {
  int? value;
  while (true) {
    String? input = stdin.readLineSync();
    value = int.tryParse(input!);
    if (value != null && value > 0) {
      return value;
    } else {
      print('Please provide a valid positive number');
    }
  }
}

double getTotal(int pennies, int nickels, int dimes, int quarters, int loonies,
    int toonies) {
  const double penny = 0.01;
  const double nickel = 0.05;
  const double dime = 0.10;
  const double quarter = 0.25;
  const double loonie = 1.0;
  const double toonie = 2.0;

  double totalValue = (pennies * penny) +
      (nickels * nickel) +
      (dimes * dime) +
      (quarters * quarter) +
      (loonies * loonie) +
      (toonies * toonie);

  return totalValue;
}
