import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_theory/model/shopping_item_model.dart';
import 'package:riverpod_theory/riverpod/state_notifier_provider.dart';

/// Provider 안에서 Provider 쓸 경우는 watch 를 사용한다.
/// read 를 써버리면 상위 Provider도 변경이 되어버리기 때문
final filteredShoppingListProvider = Provider<List<ShoppingItemModel>>((ref) {
  /* watch 가 두개이기 때문에 둘중 하나만 값이 변경되어도 재호출 */
  final filterState = ref.watch(filterProvider);
  final shoppingListState = ref.watch(shoppingListNotifierProvider);

  if (filterState == FilterState.all) {
    return shoppingListState;
  }

  /* where 는 값들중에서 해당하는 값들만 추려서 리턴 */
  return shoppingListState
      .where((element) =>
          filterState == FilterState.spicy ? element.isSpicy : !element.isSpicy)
      .toList();
});

enum FilterState { notSpicy, spicy, all }

final filterProvider = StateProvider<FilterState>((ref) => FilterState.all);
