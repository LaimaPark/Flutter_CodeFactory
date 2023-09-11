import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_theory/screen/home_screen.dart';

void main() {
  runApp(
    ProviderScope( /* ProviderScope 가 상위에 있어야 인식 가능 */
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    ),
  );
}
