
import 'package:flutter_riverpod/flutter_riverpod.dart';

/* async* 는 yield 를 통해 Stream return*/
/* 화면 나갔다가 다시 와도 Caching 되어 있음 */
final multipleStreamProvider = StreamProvider<List<int>>((ref) async*{
  for(int i = 0; i < 10; i++) {
    await Future.delayed(Duration(seconds: 1));

    yield List.generate(3, (index) => index * i);
  }
});