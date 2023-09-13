import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../layout/default_layout.dart';
import '../model/shopping_item_model.dart';
import '../riverpod/state_notifier_provider.dart';


class StateNotifierProviderScreen extends ConsumerWidget {
  const StateNotifierProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /* StateNotifierProvider 가 List 형태 */
    /* 바로 state 가 return */
    List<ShoppingItemModel> state = ref.watch(shoppingListNotifierProvider);

    return DefaultLayout(
      title: 'StateNotifierProvider',
      body: ListView(
        children: state
            .map(
              (e) => CheckboxListTile(
            value: e.hasBought, /* 우측 체크 버튼값 */
            title: Text('${e.name}(${e.quantity})'),
            onChanged: (value) {
              /* 눌렀을때 반응? -> read */
              ref.read(shoppingListNotifierProvider.notifier).toggleHasBought(
                name: e.name,
              );
            },
          ),
        )
            .toList(),
      ),
    );
  }
}
