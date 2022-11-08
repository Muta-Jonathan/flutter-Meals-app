import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../Widgets/category_item.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(20),
      // ignore: sort_child_properties_last
      children: DUMMY_CATEGORIES
          .map(
            (data) => CategoryItem(
              title: data.title,
              color: data.color,
              id: data.id,
            ),
          )
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}
