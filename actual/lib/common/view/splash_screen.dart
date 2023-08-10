import 'package:actual/common/const/colors.dart';
import 'package:actual/common/layout/default_layout.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      backgroundColor: PRIMARY_COLOR,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'asset/img/logo/logo.png',
            width: MediaQuery.of(context).size.width / 2,
          ),
          const SizedBox(height: 16.0),
          CircularProgressIndicator(
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
