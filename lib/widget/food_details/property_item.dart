import 'package:flutter/material.dart';

class PropertyItem extends StatelessWidget {
  final propertyName;
  final propertyValue;
  const PropertyItem(
      {super.key, required this.propertyName, required this.propertyValue});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          propertyName,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontWeight: FontWeight.w700, color: Colors.grey),
        ),
        Text(propertyValue,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.w700)),
      ],
    );
  }
}
