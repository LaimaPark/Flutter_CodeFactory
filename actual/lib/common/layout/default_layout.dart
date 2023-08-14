import 'package:flutter/material.dart';

/* 모든 View에 공통적으로 적용하고 싶은게 있을 때! (a.k.a BaseAcvtivity) */

class DefaultLayout extends StatelessWidget {
  final Color? backgroundColor;
  final Widget child;
  final String? title;

  const DefaultLayout({
    required this.child,
    this.backgroundColor,
    this.title,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /* 입력받은 child 를 그대로 넘겨주는 역할만 함 */
    return Scaffold(
      // ?? = ?:
      backgroundColor: backgroundColor ?? Colors.white,
      appBar: renderAppBar(),
      body: child,
    );
  }
  AppBar? renderAppBar() {
    if (title == null) {
      return null;
    } else {
      return AppBar(
        backgroundColor: Colors.white,
        elevation: 0, /* 요즘은 없는게 트렌드 */
        title: Text(
          title!
        )
      );
    }
  }

}
