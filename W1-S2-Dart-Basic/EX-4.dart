void main() {
  Map<String, double> pizzaPrice = {
    'margherita': 5.5,
    'pepperoni': 7.5,
    'vegetarian': 6.5,
  };
  List<String> order = ['margherita', 'vegetarian', 'pizza'];
  double total = 0;
  for (String num in order) {
    if (pizzaPrice.containsKey(num)) {
      total += pizzaPrice[num]!;
    } else {
      print("\" $num \" is not on the menu");
    }
  }
  print("Total: \$$total");
}
