import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:tp/models/cart_item.dart';
import 'package:tp/models/food.dart';

class Restaurant extends ChangeNotifier {
  // list of food menu
  final List<Food> _menu = [
    // Burgers
    Food(
      name: "Classic Cheeseburger",
      description:
      "Juicy beef patty with melted cheddar, lettuce, tomato, onion, and pickle in a soft bun.",
      imagePath: "lib/assets/burgers/Cheeseburger.jpeg",
      price: 1.99,
      category: FoodCategory.burgers,
      availabelAddons: [
        Addon(name: "Extra Cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.49),
      ],
    ),
    Food(
      name: "Beef Burger",
      description:
      "Grilled beef burger with smoky flavor, cheddar, caramelized onions, and special sauce.",
      imagePath: "lib/assets/burgers/beef_burger.jpeg",
      price: 2.49,
      category: FoodCategory.burgers,
      availabelAddons: [
        Addon(name: "Double Patty", price: 1.99),
        Addon(name: "Extra Sauce", price: 0.49),
      ],
    ),
    Food(
      name: "Hotdog-Style Burger",
      description:
      "A unique twist — beef burger in a hotdog bun with pickles, cheese, and tangy sauce.",
      imagePath: "lib/assets/burgers/burger_hotdog.jpeg",
      price: 2.29,
      category: FoodCategory.burgers,
      availabelAddons: [
        Addon(name: "Extra Cheese", price: 0.79),
        Addon(name: "Spicy Jalapeños", price: 0.59),
      ],
    ),

    // Desserts
    Food(
      name: "Chocolate Mousse Cake",
      description:
      "Rich chocolate mousse layered over a soft sponge base, topped with cocoa dust.",
      imagePath: "lib/assets/desserts/Chocolate_Mousse_Cake.jpeg",
      price: 1.59,
      category: FoodCategory.desserts,
      availabelAddons: [Addon(name: "Whipped Cream", price: 0.49)],
    ),
    Food(
      name: "Red Velvet Cupcakes",
      description:
      "Moist red velvet cupcakes with smooth cream cheese frosting and cocoa notes.",
      imagePath: "lib/assets/desserts/Red_velvet_cupcakes.jpeg",
      price: 1.19,
      category: FoodCategory.desserts,
      availabelAddons: [Addon(name: "Extra Frosting", price: 0.39)],
    ),
    Food(
      name: "Tiramisu",
      description:
      "Classic Italian dessert with espresso-soaked ladyfingers and mascarpone cream.",
      imagePath: "lib/assets/desserts/tiramisu.jpeg",
      price: 1.79,
      category: FoodCategory.desserts,
      availabelAddons: [Addon(name: "Extra Cocoa Dust", price: 0.29)],
    ),

    // Drinks
    Food(
      name: "Iced Coffee",
      description:
      "Chilled coffee with creamy milk and ice — perfect for a refreshing caffeine kick.",
      imagePath: "lib/assets/drinks/Iced_Coffee.jpeg",
      price: 0.99,
      category: FoodCategory.drinks,
      availabelAddons: [
        Addon(name: "Caramel Syrup", price: 0.39),
        Addon(name: "Extra Shot", price: 0.59),
      ],
    ),
    Food(
      name: "Hot Chocolate",
      description:
      "Smooth, rich hot chocolate topped with whipped cream and chocolate drizzle.",
      imagePath: "lib/assets/drinks/Hot_Chocolate.jpeg",
      price: 0.89,
      category: FoodCategory.drinks,
      availabelAddons: [Addon(name: "Marshmallows", price: 0.29)],
    ),
    Food(
      name: "Iced Mojito",
      description:
      "Refreshing mint and lime drink served over ice for a zesty, cool experience.",
      imagePath: "lib/assets/drinks/Frozen_Mojito.jpeg",
      price: 1.09,
      category: FoodCategory.drinks,
      availabelAddons: [Addon(name: "Extra Mint", price: 0.19)],
    ),

    // Salads
    Food(
      name: "Fresh Salad",
      description:
      "Crisp lettuce, cucumber, tomatoes, and carrots with light olive oil dressing.",
      imagePath: "lib/assets/salads/Fresh_Salad_Recipe.jpeg",
      price: 1.49,
      category: FoodCategory.salad,
      availabelAddons: [Addon(name: "Extra Dressing", price: 0.29)],
    ),
    Food(
      name: "Fruit Salad",
      description:
      "Seasonal fruits mixed with honey-lime drizzle — light and refreshing.",
      imagePath: "lib/assets/salads/fruits_salad.jpeg",
      price: 1.29,
      category: FoodCategory.salad,
      availabelAddons: [Addon(name: "Chia Seeds", price: 0.39)],
    ),
    Food(
      name: "White Balsamic Vinaigrette Salad",
      description:
      "Greens tossed in white balsamic vinaigrette with cherry tomatoes and feta.",
      imagePath: "lib/assets/salads/White_balsamic_Vinaigrette.jpeg",
      price: 1.59,
      category: FoodCategory.salad,
      availabelAddons: [Addon(name: "Grilled Chicken", price: 0.99)],
    ),

    // Sides
    Food(
      name: "Grilled Sweet Potato",
      description:
      "Lightly seasoned grilled sweet potato slices with a smoky finish.",
      imagePath: "lib/assets/sides/Sweet_Potato.jpeg",
      price: 0.99,
      category: FoodCategory.sides,
      availabelAddons: [Addon(name: "Garlic Dip", price: 0.29)],
    ),
    Food(
      name: "Mac and Cheese",
      description:
      "Classic creamy macaroni with melted cheddar and golden crust.",
      imagePath: "lib/assets/sides/Mac_and_Cheese.jpeg",
      price: 1.29,
      category: FoodCategory.sides,
      availabelAddons: [Addon(name: "Extra Cheese", price: 0.49)],
    ),
    Food(
      name: "Seafood Risotto",
      description:
      "Creamy risotto with shrimp, calamari, and Parmesan — rich and flavorful.",
      imagePath: "lib/assets/sides/Seafood_Risotto.jpeg",
      price: 1.79,
      category: FoodCategory.sides,
      availabelAddons: [Addon(name: "Extra Parmesan", price: 0.39)],
    ),
  ];

  // GETTERS
  List<Food> get menu => _menu;

  // user cart

  final List<CartItem> _cart = [];

  List<CartItem> get cart => _cart;

  /*-------------OPERATIONS------------*/

  // add to cart
  void addToCart(Food food, List<Addon> selectedAddons) {
    // Try to find an existing item in the cart that matches | it's equivalent .firstWhere but .firstWhereOrNull() → returns null instead of throwing
    // the same food AND the same list of selected addons.
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      // Check if the base food item is the same
      bool isSameFood = item.food == food;

      // Check if both items have identical addon lists
      // (uses deep equality from the collection package)
      bool isSameAddons = ListEquality().equals(
        item.selectedAddons,
        selectedAddons,
      );

      // If both food and addons match, this is the same cart item
      return isSameFood && isSameAddons;
    });

    // If the same item already exists in the cart
    if (cartItem != null) {
      // Just increase its quantity by 1
      cartItem.quantity++;
    } else {
      // Otherwise, add a new CartItem to the cart
      _cart.add(CartItem(food: food, selectedAddons: selectedAddons));
    }

    // Notify listeners that the cart has changed
    // (so the UI updates in Flutter)
    notifyListeners();
  }

  //remove from cart

  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  //get total price
  double getTotalPrice() {
    double total = 0.0;

    for (CartItem cartItem in _cart) {
      // use the getter from CartItem to get the total price of each item
      total += cartItem.totalPrice;
    }

    return total;
  }

  //get total number of items in cart

  int getTotalItemCount() {
    int totalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }

    return totalItemCount;
  }

  //clear cart

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  /*---------HELPERS--------*/

  //generate a receipt
  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here's your receipt.");
    receipt.writeln();

    String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("-------------------");

    for (final cartItem in _cart) {
      receipt.writeln(
        "${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}"
      );
      if(cartItem.selectedAddons.isNotEmpty) {
        receipt.writeln("    Add-ons: ${_formatAddons(cartItem.selectedAddons)}");
        receipt.writeln();
      }
    }

    receipt.writeln("-------------------");
    receipt.writeln();
    receipt.writeln("Total Items: ${getTotalItemCount()}");
    receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");

    return receipt.toString();
  }

  //format double value into money
  String _formatPrice(double price) {
    return "\$${price.toStringAsFixed(2)}";
  }

  //format list of addons into a string summary
  String _formatAddons(List<Addon> addons) {
    return addons.map((addon) => "${addon.name} (${_formatPrice(addon.price)})").join(", ");
  }
}
