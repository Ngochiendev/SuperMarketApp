import 'package:sale_app/Src/Models/item_models.dart';

class CartItemModels {
  itemModels item;
  int quantity;

  CartItemModels({
    required this.item,
    required this.quantity,
  });
  double totalPrice() {
    return item.price * quantity;
  }
}
