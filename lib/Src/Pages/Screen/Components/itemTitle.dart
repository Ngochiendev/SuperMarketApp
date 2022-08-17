// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors, unnecessary_string_interpolations
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:sale_app/Src/Models/item_models.dart';
import 'package:sale_app/Src/Pages/Values/custom_color.dart';
import 'package:sale_app/Src/Pages/Values/custom_text.dart';
import 'package:sale_app/Src/Services/ultilServices.dart';
import 'package:sale_app/Src/product/ProductScreen.dart';

class itemTitle extends StatefulWidget {
  itemModels item;
  final UltilServices ultilServices = UltilServices();
  final void Function(GlobalKey) cartAnimationMethod;

  itemTitle({
    Key? key,
    required this.item,
    required this.cartAnimationMethod,
  }) : super(key: key);

  @override
  State<itemTitle> createState() => _itemTitleState();
}

class _itemTitleState extends State<itemTitle> {
  final UltilServices ultilServices = UltilServices();

  final GlobalKey imageGK = GlobalKey();

  IconData titleIcon = Icons.shopping_cart;

  Future<void> switchIcon() async {
    setState(() => titleIcon = Icons.check);
    await Future.delayed(Duration(milliseconds: 1300));
    setState(() => titleIcon = Icons.shopping_cart);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // product screen
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ProductScreen(
                  item: widget.item,
                ),
              ),
            );
            print('product screen');
          },
          child: Card(
            elevation: 1,
            shadowColor: Colors.grey.shade500,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //image
                  Expanded(
                    child: Image.asset(widget.item.imgUrl[0]),
                  ),

                  // name
                  Text(
                    widget.item.itemName,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.h2.copyWith(fontSize: 19),
                  ),
                  // price - unit
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text.rich(
                          TextSpan(
                            style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              color: Colors.red,
                              fontWeight: FontWeight.w600,
                            ),
                            children: [
                              TextSpan(
                                  text:
                                      '${ultilServices.priceToCurrency(widget.item.price)}'),
                              TextSpan(text: '/${widget.item.unit}')
                            ],
                          ),
                        ),
                      ),

                      // Text(
                      //     overflow: TextOverflow.ellipsis,
                      //     ultilServices.priceToCurrency(item.price)),
                      // // Text(
                      // //   '${item.price.toStringAsFixed(3)}\đ ${''}',
                      // //   style: AppStyles.h2
                      // //       .copyWith(fontSize: 17, color: Colors.red.shade500),
                      // // ),
                      // Text(
                      //   overflow: TextOverflow.ellipsis,
                      //   '/${item.unit}',
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),

        // add cart
        Positioned(
          bottom: 3,
          right: 4,
          child: GestureDetector(
            onTap: () {
              print('Order Cart');
            },
            child: Container(
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  color: Colors.red),
              child: Icon(
                Icons.shopping_cart,
                color: Appcolor.backgroundColor,
                size: 20,
              ),
            ),
          ),
        )
      ],
    );
  }
}
