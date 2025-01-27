import 'dart:async';
import 'package:category/core/helper/cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../auth/view/login/login_screen.dart';
import '../layout/layout.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future handlePush() async {
    Timer(const Duration(seconds: 3), () {
      if (CacheHelper.getToken() == null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  LoginScreen()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const Layout()),
        );
      }
    });
  }
  @override
  void initState() {
    super.initState();

    handlePush();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                height: 200,
                child: Image.network(
                  'https://static.vecteezy.com/system/resources/previews/025/894/618/original/cute-word-hello-cartoon-style-illustration-vector.jpg',
                  fit: BoxFit.fill,
                ),
              ),
              const SpinKitThreeBounce(
                color: Colors.indigo,
                size: 50.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
