import 'package:flutter/material.dart';

class FoodItemCounter extends StatefulWidget {
  const FoodItemCounter({super.key});

  @override
  State<FoodItemCounter> createState() => _FoodItemCounterState();
}

class _FoodItemCounterState extends State<FoodItemCounter> {
  int counter = 1;

  void incrementCounter() {
    setState(() {
      counter = counter + 1;
    });
  }

  void decrementCounter() {
    setState(() {
      if (counter > 1) {
        counter = counter - 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DecoratedBox(
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.only(top: 4, bottom: 4, right: 5, left: 5),
        child: Row(
          children: [
            IconButton(
              onPressed: decrementCounter,
              icon: const Icon(Icons.remove),
              iconSize: 30,
              color: counter > 1 ? Colors.black : Colors.red,
              alignment: Alignment.center,
            ),
            SizedBox(
              width: size.width * 0.050,
            ),
            Text(
              '$counter',
              style: const TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: size.width * 0.050,
            ),
            IconButton(
              onPressed: incrementCounter,
              icon: const Icon(
                Icons.add,
              ),
              iconSize: 29,
            ),
          ],
        ),
      ),
    );
  }
}
