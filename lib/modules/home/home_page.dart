import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:meals/shareds/components/category/category_item.dart';
import 'package:meals/shareds/data/dummy_data.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      itemCount: dummyCategories.length,
      crossAxisCount: 2,
      mainAxisSpacing: 20,
      crossAxisSpacing: 20,
      padding: const EdgeInsets.all(20),
      itemBuilder: (context, index) {
        return CategoryItem(
          category: dummyCategories[index],
          extent: (index % 1.2 + 1.5) * 100,
          index: index,
        );
      },
    );
  }
}
