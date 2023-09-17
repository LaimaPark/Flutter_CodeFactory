import 'package:flutter/material.dart';

class DefaultLayout extends StatelessWidget {
  final Widget body;

  const DefaultLayout({
    required this.body,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('라우트'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: body,
      ),
    );
  }
}
