import 'package:actual/common/view/splash_screen.dart';
import 'package:actual/user/view/login_screen.dart';
import 'package:flutter/material.dart';

import 'common/component/custom_text_form_field.dart';

void main() {
  runApp(
    // 최상위에는 무조건 MaterialApp 이 들어가야한다.
    // 그래서 _App 안에서 최상위 return = Material
    _App()
  );
}

class _App extends StatelessWidget {
  const _App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'NotoSans',
      ),
      debugShowCheckedModeBanner: false /* debug 없애기 */,
      home: SplashScreen()
    );
  }
}
