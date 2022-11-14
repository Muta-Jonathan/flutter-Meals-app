import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/Widgets/meal_item.dart';
import 'package:meal_app/models/meal.dart';
import '../data/dummy_data.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routeName = '/category-item-screen';

  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String? categoryTitle;
  late List<Meal> displayedItems;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
      final routeArgs =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      final categoryId = routeArgs['id'];
      categoryTitle = routeArgs['title']!;
      displayedItems = DUMMY_MEALS.where(
        (item) {
          return item.categories.contains(categoryId);
        },
      ).toList();
      
    super.didChangeDependencies();
  }

  void _removeItem(String mealId) {
    setState(() {
      displayedItems.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
          itemBuilder: ((context, index) {
            return MealItem(
              id: displayedItems[index].id,
              name: displayedItems[index].name,
              imageUrl: displayedItems[index].imageUrl,
              duration: displayedItems[index].duration,
              complexity: displayedItems[index].complexity,
              affordability: displayedItems[index].affordability,
              removeItem: _removeItem,
            );
          }),
          itemCount: displayedItems.length),
    );
  }
}
