import 'package:e_commerce/presentation/order/order_page.dart';
import 'package:flutter/material.dart';

import '../../common/constant/colors.dart';
import '../../common/constant/images.dart';
import '../../data/dataSources/auth_local_datasource.dart';
import '../auth/login_page.dart';

import '../shiping_address/shipping_address_page.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Image.asset(
              Images.iconUser,
              width: 24.0,
            ),
            title: const Text(
              'Profil',
              style: TextStyle(
                color: ColorName.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const ProfilePage()),
              // );
            },
          ),
          ListTile(
            leading: Image.asset(
              Images.iconbag,
              width: 24.0,
            ),
            title: const Text(
              'Pesanan',
              style: TextStyle(
                color: ColorName.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  const OrderPage()),
              );
            },
          ),
          ListTile(
            leading: Image.asset(
              Images.iconLocation,
              width: 24.0,
            ),
            title: const Text(
              'Alamat',
              style: TextStyle(
                color: ColorName.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ShippingAddressPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.logout,
              color: ColorName.primary,
              size: 24.0,
            ),
            title: const Text(
              'Logout',
              style: TextStyle(
                color: ColorName.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
            onTap: () async {
              await AuthLocalDatasource().removeAuthData();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return const LoginPage();
              }));
            },
          ),
        ],
      ),
    );
  }
}


//  return Scaffold(
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () async {
//             await AuthLocalDatasource().removeAuthData();
//             Navigator.pushReplacement(context,
//                 MaterialPageRoute(builder: (context) {
//               return const LoginPage();
//             }));
//           },
//           child: const Text('Logout'),
//         ),
//       ),
//     );