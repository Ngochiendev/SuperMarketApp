// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sale_app/Src/Models/cart_item_models.dart';
import 'package:sale_app/Src/Pages/Screen/AllScreen.dart';
import 'package:sale_app/Src/Pages/Screen/Components/Cart_title.dart';
import 'package:sale_app/Src/Pages/Screen/Components/QRpayment_dialog.dart';
import 'package:sale_app/Src/Pages/Values/custom_text.dart';
import 'package:sale_app/Src/Services/ultilServices.dart';
import 'package:sale_app/Src/Pages/Values/app_data.dart' as appdata;

class CartScreen extends StatefulWidget {
  CartScreen({Key? key}) : super(key: key);
  final UltilServices ultilServices = UltilServices();

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void removeItemCart(CartItemModels ItemCart) {
    setState(() {
      appdata.cartItem.remove(ItemCart);
      widget.ultilServices
          .ShowToast(message: '${ItemCart.item.itemName} Remove product');
    });
  }

  double cartTotalPrice() {
    double total = 0;
    for (var item in appdata.cartItem) {
      total += item.totalPrice();
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => AllScreen()),
            );
          },
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
        title: Text(
          'Cart',
          style: AppStyles.h1.copyWith(color: Colors.black, fontSize: 25),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            //item
            child: ListView.builder(
              itemCount: appdata.cartItem.length,
              itemBuilder: (_, int index) {
                return CartTitle(
                  cartItem: appdata.cartItem[index],
                  remove: removeItemCart,
                );
              },
            ),
          ),

          //total and payment
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      // spreadRadius: 2,
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(2, 2)),
                ],
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(40),
                ),
                color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Total',
                  style: AppStyles.h1.copyWith(color: Colors.black),
                ),
                Text(
                  widget.ultilServices.priceToCurrency(cartTotalPrice()),
                  style:
                      AppStyles.h1.copyWith(color: Colors.green, fontSize: 23),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 82, 232, 87),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () async {
                    bool? result = await showOderConfirm();
                    if (result ?? false) {
                      return showDialog(
                          context: context,
                          builder: (_) {
                            return QRPaymentDialog(order: appdata.order.first);
                          });
                    } else {
                      widget.ultilServices.ShowToast(
                          message: 'Không được xác nhận', isError: true);
                    }
                  },
                  child: Text('Payment',
                      style: AppStyles.h1
                          .copyWith(fontSize: 22, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<bool?> showOderConfirm() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            title: Text('Đặt Hàng'),
            content: Text('Bạn Xác Nhận Đặt Hàng Chứ?'),
            actions: [
              TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop(false);
                  print('no');
                },
                child: Text('No'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop(true);
                  print('yes');
                },
                child: Text('Yes'),
              )
            ]);
      },
    );
  }
}
