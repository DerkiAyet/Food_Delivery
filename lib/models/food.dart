class Food {
  final String name;
  final String description;
  final String imagePath;
  final double price;
  final FoodCategory category;
  List<Addon> availabelAddons; // example: [extra cheese, sauce, pickles...]

  Food({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.category,
    required this.availabelAddons
  });
}

enum FoodCategory { burgers, salad, sides, desserts, drinks }

// food addons

class Addon {
  String name;
  double price;

  Addon({required this.name, required this.price});
}
