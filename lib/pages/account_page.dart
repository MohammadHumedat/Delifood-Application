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
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontSize: MediaQuery.of(context).size.height * 0.025,
            fontWeight: FontWeight.w400),
      ),
      leading: Icon(
        icon,
        size: MediaQuery.of(context).size.height * 0.045,
        color: Colors.deepOrange,
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle,
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
    final textScale = MediaQuery.of(context)
        .textScaler; // Get the size of the screen and text scale factor
    final bool isLandScape = MediaQuery.of(context).orientation ==
        Orientation.landscape; // Check if the device is in landscape mode
    return SingleChildScrollView(
      physics:
          const BouncingScrollPhysics(), // Allows the user to scroll the page
      child: Column(
        children: [
          if (!isLandScape) ...[
            // If the device is in portrait mode, show a smaller image
            SizedBox(
              height: size.height * 0.03, // Add some space at the top
            ),
            Container(
              height: size.height * 0.18,
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
              height: 20,
            ),
          ],
          if (isLandScape) ...[
            // If the device is in landscape mode, show a larger image
            Row(
              children: [
                SizedBox(
                    width: size.width *
                        0.05), // Add some space to the left of the row
                Image.asset('assets/images/Myphoto.jpg',
                    height: size.height * 0.18,
                    width: size.height * 0.18,
                    fit: BoxFit.cover),
                const SizedBox(width: 10),

                // Container(
                //   height: size.height * 0.28,
                //   decoration: const BoxDecoration(
                //     shape: BoxShape.circle,
                //     image: DecorationImage(
                //         image: AssetImage('assets/images/Myphoto.jpg'),
                //         fit: BoxFit.contain),
                //   ),
                // ),
                SizedBox(width: size.width * 0.005),
                Text(
                  'Mohammad Hmedat',
                  softWrap: true,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontWeight: FontWeight.w400),
                  textScaler: textScale,
                  maxLines: 2,
                  // Use textScaler to adjust text size
                ),
              ],
            ),
          ],
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
      ),
    );
  }
}
