import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../model/cart_model.dart';

class CartController extends GetxController {
  RxList<CartItemModel> cart = <CartItemModel>[].obs;

  void addCart(CartItemModel item) {
    int index = cart.indexWhere((e) => e.name == item.name);

    if (index != -1) {
      cart[index].qty.value++;
    } else {
      cart.add(item);
    }
  }

  void qualityInc(CartItemModel item) {
    item.qty.value++;
  }

  void qualityDec(CartItemModel item) {
    if (item.qty.value > 1) {
      item.qty.value--;
    }else {
      Get.snackbar(
        "Minimum Quantity",
        "Quantity can't be less than 1",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void removeItem(CartItemModel item) {
    cart.remove(item);
  }

  double get subtotal =>
      cart.fold(0, (sum, item) => sum + (item.price * item.qty.value));

  double get discount => subtotal * 0.10;
  double get delivery => cart.isNotEmpty ? 20 : 0; // optional
  double get total => subtotal - discount + delivery;
}
