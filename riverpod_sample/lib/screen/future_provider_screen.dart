import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../layout/default_layout.dart';
import '../riverpod/future_provider.dart';

class FutureProviderScreen extends ConsumerWidget {
  const FutureProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<int>> numbers = ref.watch(multiplesFutureProvider);

    return DefaultLayout(
      title: 'FutureProviderScreen',
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          numbers.when(
            /* data : 값이 있을때 (state 값) */
            data: (data) => Text(
              data.toString(),
              textAlign: TextAlign.center,
            ),
            error: (err, stack) => Text('Error: $err'),
            loading: () => Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ],
      ),
    );
  }
}

/// FutureProvider 는 Future로 값이 들어오게 되면 data 에서 처리해준다
/// 한번 데이터를 불러오고 나면 그 이후 캐싱이 되기 때문에 다시 화면에 진입할때는 데이터가 있다.
/// error 는 throw 로 받을 수 있다.
/// data 는 AsyncValue 형태로 오게 되는데, 이거로 data, error, loading 형태를 나눈다