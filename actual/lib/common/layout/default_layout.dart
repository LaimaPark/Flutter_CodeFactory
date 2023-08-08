import 'package:flutter/material.dart';

/* 모든 View에 공통적으로 적용하고 싶은게 있을 때! (a.k.a BaseAcvtivity) */

class DefaultLayout extends StatelessWidget {
  final Widget child;

  const DefaultLayout({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /* 입력받은 child 를 그대로 넘겨주는 역할만 함 */
    return Scaffold(
      backgroundColor: Colors.white,
      body: child,
    );
  }
}