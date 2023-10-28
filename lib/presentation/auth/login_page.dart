// ignore_for_file: unnecessary_const

import 'package:e_commerce/common/components/button.dart';
import 'package:e_commerce/common/components/space_height.dart';
import 'package:e_commerce/common/components/space_width.dart';
import 'package:e_commerce/common/constant/colors.dart';
import 'package:e_commerce/common/constant/images.dart';
import 'package:e_commerce/presentation/auth/register_page.dart';
import 'package:e_commerce/presentation/home/widget/dashboard_page.dart';
import 'package:flutter/material.dart';

import '../../common/components/custom_text_field.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
   @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const SpaceWidth(80.0),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 130.0),
              child: Image.asset(
                Images.logo1,
                width: 100,
                height: 100,
              )),
          const SpaceHeight(24.0),
          const Center(
            child: Text(
              "SHOP PAY",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: ColorName.dark,
              ),
            ),
          ),
          const SpaceHeight(8.0),
          const Center(
            child: Text(
              "Masuk untuk melanjutkan",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: ColorName.grey,
              ),
            ),
          ),
          const SpaceHeight(40.0),
          CustomTextField(
            controller: usernameController,
            label: 'Username',
          ),
          const SpaceHeight(12.0),
          CustomTextField(
            controller: passwordController,
            label: 'Password',
            obscureText: true,
          ),
          const SpaceHeight(24.0),
          Button.filled(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const DashboardPage(),
                ),
              );
            },
            label: 'Masuk',
          ),
          const SpaceHeight(122.0),
          Center(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegisterPage(),
                  ),
                );
              },
              child: const Text.rich(
                TextSpan(
                  text: "Belum punya akun? ",
                  children: [
                    TextSpan(
                      text: "Register",
                      style: TextStyle(color: ColorName.primary),
                    ),
                  ],
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: ColorName.grey,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}