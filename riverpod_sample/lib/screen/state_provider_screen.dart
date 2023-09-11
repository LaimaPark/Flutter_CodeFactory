import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_theory/layout/default_layout.dart';
import 'package:riverpod_theory/riverpod/state_provider.dart';

/* ConsumerWidget : Stl 와 거의 비슷하지만, build 에서 ref 파라미터 받음 */
class StateProviderScreen extends ConsumerWidget {
  const StateProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(numberProvider); /* 보통 여기 위치함 */

    return DefaultLayout(
      title: 'State Provider',
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            provider.toString(),
            textAlign: TextAlign.center,
          ),
          ElevatedButton(
            onPressed: () {
              ref.read(numberProvider.notifier).state =
                  ref.read(numberProvider.notifier).state - 1;
            },
            child: Text(
              'DOWN',
            ),
          ),
          ElevatedButton(
            onPressed: () { /* state = 현재 상태 */
              ref.read(numberProvider.notifier).update((state) => state + 1);
            },
            child: Text('UP'),
          ),
        ],
      ),
    );
  }
}


/// ref.read VS ref.watch
/// ref.watch 는 값이 바뀔때마다 build 함수 실행
/// ref.watch 는 UI 관련 코드에만 사용한다. (반응형)
/// ref.read 는 실행되는 순간 딱 한번 provider 값을 가져온다.
/// ref.read 는 onPressed 처럼 액션 뒤에 실행되는 함수 내부에서 사용
/// ** ref.read 는 watch 처럼 쭉 지켜보고 있을 필요가 없다.
