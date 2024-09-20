import 'dart:ffi';

import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  Widget orderVouchers({required String name, required int number}) {
    return Column(
      children: [
        Text(
          '$number',
          style: const TextStyle(
              fontSize: 25,
              color: Colors.deepOrange,
              fontWeight: FontWeight.bold),
        ),
        Text(
          '$name',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  Widget itemListTile(
      {required String title, String? subtitle, required IconData icon}) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 18),
      ),
      leading: Icon(
        icon,
        size: 33,
        color: Colors.deepOrange,
      ),
      subtitle: subtitle != null ? Text('$subtitle') : null,
      trailing: const Icon(
        Icons.chevron_right,
        size: 27,
        color: Colors.deepOrange,
      ),
    );
  }

  Widget divider() {
    return const Divider(
      thickness: 2,
      indent: 17,
      endIndent: 17,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 250,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                image: AssetImage('assets/images/Myphoto.jpg'),
                fit: BoxFit.contain),
          ),
        ),
        const SizedBox(height: 15),
        const Text(
          'Mohammad Hmedat',
          style: TextStyle(
              fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            orderVouchers(name: 'Order', number: 50),
            orderVouchers(name: 'Vouchers', number: 10),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        divider(),
        itemListTile(title: 'Past Orders', icon: Icons.shopping_cart),
        divider(),
        itemListTile(title: 'Available Vouchers', icon: Icons.card_giftcard),
        divider(),
        
      ],
    );
  }
}
