import 'package:flutter_riverpod/flutter_riverpod.dart';

/// family modifier 를 사용하며 두번째 param 을 받음 (data)
/// 외부에서 param 값 받아서 활용
final familyModifierProvider = FutureProvider.family<List<int>, int>((ref, data) async{

  await Future.delayed(Duration(seconds: 2));

  return List.generate(5, (index) => index * data);

});