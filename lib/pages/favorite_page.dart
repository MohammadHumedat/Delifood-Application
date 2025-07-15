import 'package:flutter/material.dart';
import 'package:food_delivery/UI_models/food_details_argus.dart';
import 'package:food_delivery/models/food_item.dart';
import 'package:food_delivery/pages/food_details_page.dart';
import 'package:food_delivery/utilities/app_assets.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    final textSacle = MediaQuery.of(context).textScaler;
    final size = MediaQuery.of(context).size;

    final favoriteItems = food
        .where((foodItem) => foodItem.isFavorite == true)
        .toList(); // Filter favorite items from the food list, using the `where` method to check if `isFavorite` is true.
    if (favoriteItems.isEmpty) {
      return Center(
        child: Column(
          children: [
            Image.asset(
              AppAssets.emptyState,
              height: size.height * 0.50,
              fit: BoxFit.cover,
            ),
            Text(
              "There Is No Favorite Food Yet.",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
              textScaler: textSacle,
              maxLines: 1,
            )
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        itemCount: favoriteItems.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            int targetedIndex = food.indexOf(favoriteItems[index]);
            Navigator.of(context)
                .pushNamed(
              FoodDetailsPage.routeName,
              // "/food-details",
              arguments: FoodDetailsArgus(foodIndex: targetedIndex),
            )
                .then((value) {
              setState(() {});
              debugPrint('This is the name of $value');
            });
          },
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Image.network(
                    favoriteItems[index].imgurl,
                    height: size.height * 0.072,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(favoriteItems[index].name,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(fontWeight: FontWeight.w500)),
                        const SizedBox(
                          height: 6,
                        ),
                        Text('\$ ${favoriteItems[index].price}',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    color: Colors.deepOrange,
                                    fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      final targeteditem = favoriteItems[index];
                      int targetedIndex = food.indexOf(targeteditem);
                      setState(() {
                        food[targetedIndex] =
                            food[targetedIndex].copywith(isFavorite: false);
                        favoriteItems.remove(targeteditem);
                      });
                    },
                    icon: Icon(
                      Icons.favorite,
                      size: size.height * 0.035,
                    ),
                    color: Colors.deepOrange,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
// Padding(
//       padding: const EdgeInsets.all(17.0),
//       child: SingleChildScrollView(
//         child: Column(
//           children:
//               food.food
//                .where((foodItem) => foodItem.isFavorite == true).map((foodItem) => FavoriteItem(foodItem: foodItem)).toList(),
//         ),
//       ),
//     );
