import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:provider/provider.dart';
import 'package:tp/components/my_current_location.dart';
import 'package:tp/components/my_description_box.dart';
import 'package:tp/components/my_drawer.dart';
import 'package:tp/components/my_food_tile.dart';
import 'package:tp/components/my_silver_app_bar.dart';
import 'package:tp/components/my_tab_bar.dart';
import 'package:tp/models/food.dart';
import 'package:tp/models/restaurant.dart';
import 'package:tp/pages/food_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: FoodCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // sort and return a list of food that belongs to a specifc catgory of food
  List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fullMenu) {
    return fullMenu.where((food) => food.category == category).toList();
  }

  // return list of foods to given category
  List<Widget> getFoodInCategory(List<Food> fullMenu) {
    return FoodCategory.values.map((category) {
      List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);
      return ListView.builder(
          itemCount: categoryMenu.length,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            final Food food = categoryMenu[index];
            return MyFoodTile(food: food,
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => FoodPage(food: food)))
            );
          });
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(child: MyDrawer()),
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) =>
          [
            MySilverAppBar(
              title: MyTabBar(tabController: _tabController),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Divider(
                    indent: 25,
                    endIndent: 25,
                    color: Theme
                        .of(context)
                        .colorScheme
                        .secondary,
                  ),
                  MyCurrentLocation(),
                  MyDescriptionBox(),
                ],
              ),
            ),
          ],
          body: Consumer<Restaurant>(
            builder: (context, restaurant, child) =>
                TabBarView(
                  controller: _tabController,
                  children: getFoodInCategory(restaurant.menu),
                ),
          )
      ),
    );
  }
}
