import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'code_generation_provider.g.dart';

// Riverpod 에서 code generation이 생긴이유
// 1) Provider, FutureProvider 등 무엇을 써야할지 고민 할 필요가 없도록 하기 위해서
//  StateNotifierProvider 는 별도로 명시할 수 있다.

final _testProvider = Provider<String>((ref) => 'a');

// 위에꺼를 일반 함수처럼 바꾸기

@riverpod
String gState(GStateRef ref/* 현재함수 이름 + Ref */) {
  return 'a';
}

// 이렇게 해주면 code_generation_provider.g.dart 파일이 생긴다.
// 해당 파일에 gStateProvider 함수가 생긴다

// 2) Parameter 를 받는 Family 파라미터를 일반 함수처럼 사용할 수 있도록 하기 위해


// flutter pub run build_runner build => dart run