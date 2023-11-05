import 'package:e_commerce/data/dataSources/auth_local_datasource.dart';
import 'package:e_commerce/presentation/auth/login_page.dart';
import 'package:flutter/material.dart';
class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await AuthLocalDatasource().removeAuthData();
            // ignore: use_build_context_synchronously
            Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
              return const LoginPage();
            },
            ),
            );
          },
           child: const Text('Logout'),
           ),
      ),
    );
  }
}