import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  Widget orderVouchers(BuildContext context,
      {required String name, required int number}) {
    return Column(
      children: [
        Text(
          number.toString(),
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(color: Colors.deepOrange),
        ),
        Text(
          name,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w400,
              ),
        ),
      ],
    );
  }

  Widget itemListTile(BuildContext context,
      {required String title, String? subtitle, required IconData icon}) {
    return ListTile(
      title: Text(title, style: Theme.of(context).textTheme.titleLarge),
      leading: Icon(
        icon,
        size: MediaQuery.of(context).size.height * 0.045,
        color: Colors.deepOrange,
      ),
      subtitle: subtitle != null
          ? Text(
              '$subtitle',
              style: Theme.of(context).textTheme.bodyMedium,
            )
          : null,
      trailing: Icon(
        Icons.chevron_right,
        size: MediaQuery.of(context).size.height * 0.03,
        color: Colors.deepOrange,
      ),
      onTap: () {},
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
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: size.height * 0.28,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                image: AssetImage('assets/images/Myphoto.jpg'),
                fit: BoxFit.contain),
          ),
        ),
        const SizedBox(height: 15),
        Text(
          'Mohammad Hmedat',
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(fontWeight: FontWeight.w400),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            orderVouchers(context, name: 'Order', number: 50),
            orderVouchers(context, name: 'Vouchers', number: 10),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        divider(),
        itemListTile(
          title: 'Past Orders',
          icon: Icons.shopping_cart,
          subtitle: 'Here you find your past orders',
          context,
        ),
        divider(),
        itemListTile(
            title: 'Available Vouchers', icon: Icons.card_giftcard, context),
        divider(),
      ],
    );
  }
}
