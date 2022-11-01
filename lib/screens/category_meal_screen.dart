import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/Widgets/meal_item.dart';
import '../data/dummy_data.dart';

class CategoryMealScreen extends StatelessWidget {
  static const routeName = '/category-item-screen';
  // final String categoryId;
  // final String categoryTitle;
  // const CategoryItemScreen(
  //     {super.key, required this.categoryId, required this.categoryTitle});

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryId = routeArgs['id'];
    final categoryTitle = routeArgs['title'];
    final categoryItems = DUMMY_MEALS.where(
      (item) {
        return item.categories.contains(categoryId);
      },
    ).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
          itemBuilder: ((context, index) {
            return MealItem(
              id: categoryItems[index].id,
              name: categoryItems[index].name,
              imageUrl: categoryItems[index].imageUrl,
              duration: categoryItems[index].duration,
              complexity: categoryItems[index].complexity,
              affordability: categoryItems[index].affordability,
            );
          }),
          itemCount: categoryItems.length),
    );
  }
}
