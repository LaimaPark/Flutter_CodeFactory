import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_theory/layout/default_layout.dart';
import 'package:riverpod_theory/riverpod/select_provider.dart';

class SelectProviderScreen extends ConsumerWidget {
  const SelectProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final state = ref.watch(selectProvider);
    /* spicy 값 변경만 보고싶다! */
    /* spicy 값이 바뀔때만 build 가 호출 */
    /* select 로 어느 값 변경을 볼 것인지 체크 */
    final state = ref.watch(selectProvider.select((value) => value.isSpicy));

    ref.listen(selectProvider.select((value) => value.hasBought), (previous, next) {

    });

    return DefaultLayout(
        title: 'SelectProviderScreen',
        body: SizedBox(
          width: double.infinity,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Text(state.name),
                // Text(state.isSpicy.toString()),
                // Text(state.hasBought.toString()),
                ElevatedButton(onPressed: () {
                  ref.read(selectProvider.notifier).toggleIsSpicy();
                }, child: Text('Spicy Toggle')),
                ElevatedButton(onPressed: () {
                  ref.read(selectProvider.notifier).toggleHasBought();
                }, child: Text('Bought Toggle')),
              ],
          ),
        )
    );
  }
}
