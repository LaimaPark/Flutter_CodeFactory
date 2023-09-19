import 'dart:js';

import 'package:go_router/go_router.dart';
import 'package:go_router_sample/screen/root_screen.dart';

final router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) {
      // 이동할 페이지 반환
      return RootScreen()
    }
  ), /* 안에서는 GoRoute */
]);
