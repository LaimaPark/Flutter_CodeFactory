import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_theory/layout/default_layout.dart';
import 'package:riverpod_theory/riverpod/provider.dart';
import 'package:riverpod_theory/riverpod/state_notifier_provider.dart';

class ProviderScreen extends ConsumerWidget {
  const ProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(filteredShoppingListProvider);

    return DefaultLayout(
        title: 'ProviderScreen',
        actions: [
          /* toolBar 에 있는 ... 모양 */
          PopupMenuButton<FilterState>(
            itemBuilder: (_) => FilterState.values.map(
                  (e) => PopupMenuItem(
                      value: e,
                      child: Text(
                          e.name
                      ),
                  ),
              ).toList(),
            onSelected: (value) {
              ref.read(filterProvider.notifier).update((state) => value);
            },
          )
        ],
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
          ).toList(),
        ),
    );
  }
}
