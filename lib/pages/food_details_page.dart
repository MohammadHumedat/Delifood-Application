import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery/models/food_item.dart';

class FoodDetailsPage extends StatelessWidget {
  final FoodItem foodItem;
  FoodDetailsPage({super.key, required this.foodItem});

  @override
  Widget build(BuildContext context) {
    double sizeFactor = MediaQuery.of(context).size.height / 100;

    return Scaffold(
      appBar: _buildAppBar(context),
      body: Column(
        children: [
          Center(
              heightFactor: sizeFactor * 3,
              child: Text(foodItem.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                  ))),
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    final bool isIos = Platform.isIOS;
    final bool isAndroid = Platform.isAndroid;

    return AppBar(
      title: isAndroid
          ? const Text(
              'Food Item Details',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: Color.fromARGB(255, 14, 9, 8),
              ),
            )
          : null,
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          isIos ? Icons.arrow_back_ios : Icons.arrow_back,
          color: const Color.fromARGB(255, 65, 63, 63),
        ),
        onPressed: () => Navigator.pop(context),
      ),
      systemOverlayStyle:
          isIos ? SystemUiOverlayStyle.dark : SystemUiOverlayStyle.light,
    );
  }
}
