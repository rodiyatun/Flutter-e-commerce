import 'package:e_commerce/common/constant/images.dart';
import 'package:e_commerce/presentation/auth/login_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration( milliseconds: 3000),
      ()=> Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const LoginPage(),
      ),
      ),
    );
    return  Scaffold(
      body: Center(
        child: Image.asset(
                Images.logo1,
                width: 400,
                height: 400,
              ),
        ),
    );
  }
}