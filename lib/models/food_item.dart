class FoodItem {
  final String id;
  final String name;
  final String imgurl;
  final double price;
  final bool isFavorite;
  final String categoryId;
  FoodItem(
      {required this.name,
      required this.imgurl,
      required this.price,
      required this.categoryId,
      required this.id,
      this.isFavorite = false});

  FoodItem copywith({
    String? name,
    String? imgurl,
    double? price,
    bool? isFavorite,
    String? categoryId,
    String? id,
  }) {
    return FoodItem(
        name: name ?? this.name,
        imgurl: imgurl ?? this.imgurl,
        price: price ?? this.price,
        isFavorite: isFavorite ?? this.isFavorite,
        categoryId: categoryId ?? this.categoryId,
        id: id ?? this.id);
  }
}

List<FoodItem> food = [
  FoodItem(
      id: 'pizza 1',
      name: 'Checken Pizza',
      imgurl:
          'https://graficsea.com/wp-content/uploads/2021/12/Chicken-Supreme-Pizza-.png',
      price: 4,
      categoryId: '3'),
  FoodItem(
      id: 'burger 1',
      name: 'Cheese Burger',
      imgurl: 'https://www.pngarts.com/files/3/Chicken-Burger-PNG-Photo.png',
      price: 3,
      categoryId: '1'),
  FoodItem(
      id: 'burger 2',
      name: 'Chicken Burger',
      imgurl:
          'https://www.pngarts.com/files/3/Chicken-Burger-PNG-Image-Background.png',
      price: 6.5,
      categoryId: '1'),
  FoodItem(
      id: 'pizza 2',
      name: 'Beaf Pizza',
      imgurl: 'https://www.pngarts.com/files/3/Pizza-PNG-Photo.png',
      price: 9.0,
      categoryId: '3'),
  FoodItem(
      id: 'pasta 1',
      name: 'Pasta',
      imgurl:
          'https://e7.pngegg.com/pngimages/94/423/png-clipart-pasta-pasta-thumbnail.png',
      price: 10.0,
      categoryId: '2'),
  FoodItem(
    id: 'steak 1',
    name: 'Beaf Steak',
    imgurl:
        'https://e7.pngegg.com/pngimages/970/842/png-clipart-barbecue-chophouse-restaurant-meat-raffle-beef-beef-tenderloin-food-beef-thumbnail.png',
    price: 15.0,
    categoryId: '4',
  ),
];
