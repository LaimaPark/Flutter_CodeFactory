import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_theory/model/shopping_item_model.dart';


final shoppingListNotifierProvider =
    StateNotifierProvider<ShoppingListNotifier/* 어떤 Notifier? */, List<ShoppingItemModel>/* 어떤 타입? */> (
  (ref) => ShoppingListNotifier(),
);

/* class 로 선언하고 StateNotifier를 무조건 상속받아야한다! + 타입지정 */
class ShoppingListNotifier extends StateNotifier<List<ShoppingItemModel>> {
  ShoppingListNotifier()
      : super( /* 처음에 어떤 상태로 관리할것인지 넣는 것 (공백으로 두어도 괜찮음) */
          [ /* state */
            ShoppingItemModel(
              name: '김치',
              quantity: 3,
              hasBought: false,
              isSpicy: true,
            ),
            ShoppingItemModel(
              name: '라면',
              quantity: 5,
              hasBought: false,
              isSpicy: true,
            ),
            ShoppingItemModel(
              name: '카스테라',
              quantity: 5,
              hasBought: false,
              isSpicy: false,
            ),
          ],
        );

  /* 값을 변경해주는 Method */
  void toggleTodo({required String name}) {
    /* state : StateNotifier 에 있는 값*/
    state = state
        .map(
          (e) => e.name == name
              ? e.copyWith(hasBought: !e.hasBought)
              : e,
        )
        .toList();
  }

  /* 값을 변경해주는 Method */
  void toggleHasBought({required String name}) {
    /* state : StateNotifier 에 있는 값*/
    state = state.map((e) =>
          e.name == name
          ? e.copyWith(hasBought: !e.hasBought) /* 같은 이름 찾아서 해당하는 값만 변경 */
          : e,
    ).toList();
  }
}
