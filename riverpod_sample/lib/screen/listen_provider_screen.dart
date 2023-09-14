import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_theory/layout/default_layout.dart';
import 'package:riverpod_theory/riverpod/listen_provider.dart';

class ListenProviderScreen extends ConsumerStatefulWidget {
  const ListenProviderScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ListenProviderScreen> createState() => _ListenProviderScreenState();
}

class _ListenProviderScreenState extends ConsumerState<ListenProviderScreen> with TickerProviderStateMixin{
  late final TabController controller;
  /* Controller!                      */
  /* 1. late 선언                      */
  /* 2. initState (vsync 는 this)     */
  /* 3. with TickerProviderStateMixin */
  /* 4. TabBarView Controller         */

  @override
  void initState() {
    super.initState();

    controller = TabController(
        length: 10,
        vsync: this,
        initialIndex: ref.read(listenProvider) /* tab 기본값이 0 그래서 초기값 설정 */
    );
  }

  @override
  Widget build(BuildContext context) {
    /* StatefulWidget 에서는 ref param 을 받지 않는다. */
    /* 바로 ref로 사용할 수 있음 */

    ref.listen<int>(listenProvider, (previous, next) {
      /* 변경전 값 = previous */
      /* 변경후 값 = next */
      /* listenProvider 값이 변경될 때마다 해당 함수 호출 */

      if (previous != next) {
        controller.animateTo(
          next
        );
      }
    });

    return DefaultLayout(
        title: 'ListenProviderScreen',
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(), /* 스크롤로 안됌 */
          controller: controller,
          children: List.generate(10, (index) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(index.toString()),
              ElevatedButton(
                  onPressed: () {
                    ref.read(listenProvider.notifier).update(
                            (state) => state == 10 ? 10 : state+1);
                  },
                  child: Text(
                      '다음'
                  )
              ),
              ElevatedButton(
                  onPressed: () {
                    ref.read(listenProvider.notifier).update(
                            (state) => state == 0 ? 0 : state-1);
                  },
                  child: Text(
                      '뒤로'
                  )
              )
            ],
          ))
        )
    );
  }
}
