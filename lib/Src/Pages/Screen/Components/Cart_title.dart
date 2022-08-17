import 'package:flutter/material.dart';
import 'package:sale_app/Src/Models/cart_item_models.dart';
import 'package:sale_app/Src/Pages/Values/app_data.dart';
import 'package:sale_app/Src/Pages/Values/custom_text.dart';
import 'package:sale_app/Src/Services/ultilServices.dart';
import 'package:sale_app/Src/product/quatityWidget/quatity.dart';

class CartTitle extends StatefulWidget {
  const CartTitle({
    Key? key,
    required this.cartItem,
    required this.remove,
  }) : super(key: key);

  final CartItemModels cartItem;
  final Function(CartItemModels) remove;
  @override
  State<CartTitle> createState() => _CartTitleState();
}

class _CartTitleState extends State<CartTitle> {
  final UltilServices ultilServices = UltilServices();
  int cartItemquatity = 1;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        // image
        leading: Image.asset(
          widget.cartItem.item.imgUrl.first,
          height: 80,
        ),
        // name
        title: Text(widget.cartItem.item.itemName,
            style: AppStyles.h1.copyWith(color: Colors.black)),

        //total
        subtitle: Text(
          ultilServices.priceToCurrency(widget.cartItem.totalPrice()),
          style: AppStyles.h2.copyWith(
            color: Colors.redAccent,
            fontWeight: FontWeight.w500,
          ),
        ),

        //quanlity
        trailing: QuatityScreen(
          value: widget.cartItem.quantity,
          suffixText: widget.cartItem.item.unit,
          result: (quantity) {
            setState(() {
              widget.cartItem.quantity = quantity;
              if (quantity == 0) {
                //remove item is cart
                widget.remove(widget.cartItem);
              }
            });
          },
          isRemove: true,
        ),
      ),
    );
  }
}
