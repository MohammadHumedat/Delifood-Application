import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FoodDetailsPage extends StatelessWidget {
  FoodDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Details Page'),
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
