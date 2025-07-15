// This file containes the list view of food categoryes that in home page screen, to provide items filtering

import 'package:flutter/material.dart';
import 'package:food_delivery/models/category_item.dart';
import 'package:food_delivery/models/food_item.dart';

class CategoryFoodList extends StatefulWidget {
  final List<FoodItem> filteredFood;
  final Function(List<FoodItem>) onFilterChanged; // Callback function
  // Callback function
  CategoryFoodList({
    super.key,
    required this.filteredFood,
    required this.onFilterChanged,
  });

  @override
  State<CategoryFoodList> createState() => _CategoryFoodListState();
}

class _CategoryFoodListState extends State<CategoryFoodList> {
  String? categoryIsChosen;
  late List<FoodItem> filteredFood;
  bool enableCategory = false;
  @override
  void initState() {
    super.initState();
    filteredFood = widget.filteredFood;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: 120, // Increased a bit for safer padding space
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: category.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsetsDirectional.only(
              end: 15.0), // spacing between items
          child: Material(
            color: Colors.black,
            shadowColor: Colors.black12,
            elevation: 10,
            borderRadius: BorderRadius.circular(15),
            child: InkWell(
              onTap: () {
                setState(() {
                  if (categoryIsChosen == category[index].id ||
                      !enableCategory) {
                    enableCategory = !enableCategory;
                  }

                  if (enableCategory) {
                    categoryIsChosen = category[index].id;
                    filteredFood = food
                        .where(
                            (element) => element.categoryId == categoryIsChosen)
                        .toList();
                    widget.onFilterChanged(filteredFood);
                  } else {
                    categoryIsChosen = null;
                    filteredFood = food;
                  }
                });
              },
              child: Container(
                width: size.width * 0.22, // Adjust width if needed
                decoration: BoxDecoration(
                  color: categoryIsChosen == category[index].id
                      ? Theme.of(context).primaryColor
                      : const Color.fromARGB(255, 243, 242, 242),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          category[index].imgPath,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Expanded(
                      flex: 1, // Take up 1/3 of the available space
                      child: Text(
                        category[index].name,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: categoryIsChosen == category[index].id
                                ? Colors.white
                                : Colors.black),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
