import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:tp/models/food.dart';

class MyTabBar extends StatelessWidget {
  final TabController? tabController;
  const MyTabBar({
    super.key,
    required this.tabController
  });

  List<Tab> _buildCategoryTabs() {
    return FoodCategory.values.map((category) {
      return Tab(
        text: category.toString().split('.').last,
      );
    }).toList();
  } // why .split('.').last : because the enum element of FoodCategory returns the values like this: [FoodCategory.burgers, FoodCategory.salad, FoodCategory.sides, FoodCategory.desserts, FoodCategory.drinks]
    // so using split('.').last will allow us to take the category itself

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabBar(
        controller: tabController,
          tabs: _buildCategoryTabs()
      ),
    );
  }
}
