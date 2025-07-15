import 'package:food_delivery/utilities/app_assets.dart';

class CategoryItem {
  final String id;
  final String name;
  final String imgPath;

  CategoryItem({required this.id, required this.name, required this.imgPath});
}

List<CategoryItem> category = [
  CategoryItem(id: '1', name: 'Burger', imgPath: AppAssets.burgerIcon),
  CategoryItem(id: '2', name: 'Pasta', imgPath: AppAssets.pastaIcon),
  CategoryItem(id: '3', name: 'Pizza', imgPath: AppAssets.pizzaIcon),
  CategoryItem(id: '4', name: 'Steak', imgPath: AppAssets.steakIcon),
  CategoryItem(id: '1', name: 'Burger', imgPath: AppAssets.burgerIcon),
  CategoryItem(id: '2', name: 'Pasta', imgPath: AppAssets.pastaIcon),
  CategoryItem(id: '3', name: 'Pizza', imgPath: AppAssets.pizzaIcon),
  CategoryItem(id: '4', name: 'Steak', imgPath: AppAssets.steakIcon),
];
