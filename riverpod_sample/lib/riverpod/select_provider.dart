import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_theory/model/shopping_item_model.dart';

                                            /*  Notifier  */  /* Return Type */
final selectProvider = StateNotifierProvider<SelectNotifier, ShoppingItemModel>((ref) => SelectNotifier());

/// StateNotifier = class 선언 후 상속받기
class SelectNotifier extends StateNotifier<ShoppingItemModel> {
  SelectNotifier() :
        super(
          ShoppingItemModel(
            name: '',
            quantity: 0,
            hasBought: false,
            isSpicy: true,
          )
      );

  toggleHasBought() {
    state.copyWith(
      hasBought: !state.hasBought
    );
  }

  toggleIsSpicy() {
    state.copyWith(
      isSpicy: !state.isSpicy
    );

    // state = ShoppingItemModel(
    //     name: state.name,
    //     quantity: state.quantity,
    //     hasBought: state.hasBought,
    //     isSpicy: !state.isSpicy);
  }

}