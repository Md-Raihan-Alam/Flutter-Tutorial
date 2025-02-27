import 'package:flutter/material.dart';

import 'package:meals_app_animation/data/dummy_data.dart';
import 'package:meals_app_animation/models/meal.dart';
import 'package:meals_app_animation/widgets/category_grid_item.dart';
import 'package:meals_app_animation/screens/meals.dart';
import 'package:meals_app_animation/models/category.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({
    super.key,
    required this.availableMeals,
  });

  final List<Meal> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  // TickerProviderStateMixing ; for multiple animation

  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this, // this -> set entire class here
      duration: const Duration(milliseconds: 600),
      lowerBound: 0, // default value
      upperBound: 1, // default value
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = widget.availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: filteredMeals,
        ),
      ),
    ); // Navigator.push(context, route)
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      child: GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          // availableCategories.map((category) => CategoryGridItem(category: category)).toList()
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              onSelectCategory: () {
                _selectCategory(context, category);
              },
            )
        ],
      ),
      builder: (context, child) => SlideTransition(
        position: Tween(
          begin: const Offset(0, 0.3),
          end: const Offset(0, 0),
        ).animate(
          CurvedAnimation(
              parent: _animationController, curve: Curves.easeInOut),
        ), // tween an object, 0 =0%, 1=100%

        child: child,
      ),
      // builder: (context, child) => Padding(
      //     padding: EdgeInsets.only(
      //       top: 100 - _animationController.value * 100,
      //     ),
      //     child: child),
    ); // child value seprare so that only Padding is done 60hz not entire grid
  }
}
