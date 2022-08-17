// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors, unnecessary_string_interpolations, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:sale_app/Src/Models/item_models.dart';
import 'package:sale_app/Src/Pages/Values/custom_color.dart';
import 'package:sale_app/Src/Pages/Values/custom_text.dart';
import 'package:sale_app/Src/Services/ultilServices.dart';
import 'package:sale_app/Src/product/quatityWidget/quatity.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({
    Key? key,
    required this.item,
  }) : super(key: key);
  final itemModels item;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final UltilServices ultilServices = UltilServices();

  int cartItemquatity = 1;

  @override
  Widget build(BuildContext context) {
    var controller = PageController(viewportFraction: 0.9);
    return Scaffold(
      // appBar: AppBar(
      //   leading: GestureDetector(
      //     onTap: () {
      //       Navigator.pop(context);
      //     },
      //     child: Icon(
      //       Icons.arrow_back_ios,
      //       color: Colors.black,
      //     ),
      //   ),
      //   backgroundColor: Colors.white.withAlpha(270),
      //   elevation: 0,
      // ),
      backgroundColor: Colors.white.withAlpha(230),
      body: Stack(
        children: [
          Column(
            children: [
              //image
              // Expanded(
              //   child: PageView.builder(
              //     controller: controller,
              //     scrollDirection: Axis.horizontal,
              //     itemCount: widget.item.imgUrl.length,
              //     itemBuilder: (context, index) {
              //       return Container(
              //         margin: EdgeInsets.symmetric(horizontal: 10),
              //         width: MediaQuery.of(context).size.width,
              //         child: Image.asset(
              //           widget.item.imgUrl[index],
              //           fit: BoxFit.fitWidth,
              //         ),
              //       );
              //     },
              //   ),
              // ),
              Expanded(
                child: PageView.builder(
                  controller: controller,
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.item.imgUrl.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(
                        widget.item.imgUrl[index],
                        fit: BoxFit.fitWidth,
                      ),
                    );
                  },
                ),
              ),

              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5,
                          offset: Offset(3, 6))
                    ],
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(50)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // name
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              overflow: TextOverflow.ellipsis,
                              widget.item.itemName,
                              style: AppStyles.h1
                                  .copyWith(color: Colors.black, fontSize: 25),
                            ),
                          ),
                          QuatityScreen(
                            suffixText: widget.item.unit,
                            value: cartItemquatity,
                            result: (int quatity) {
                              setState(() {
                                cartItemquatity = quatity;
                              });
                            },
                          ),
                        ],
                      ),
                      // price
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '${ultilServices.priceToCurrency(widget.item.price)}',
                        style: AppStyles.h1
                            .copyWith(color: Colors.red, fontSize: 17),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 10),
                      //description
                      Expanded(
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Text(
                            widget.item.description * 50,
                            overflow: TextOverflow.clip,
                            style: TextStyle(height: 1.5, letterSpacing: 0.3),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      // buttton Buy
                      ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          onPressed: () {
                            print('Button Add Cart');
                          },
                          icon: Icon(Icons.shopping_cart_outlined),
                          label: Text(
                            'Add to card',
                            style: AppStyles.h2.copyWith(fontSize: 20),
                          ))
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 15,
            left: 10,
            child: SafeArea(
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  print('Back Home Screen');
                },
                child: Icon(Icons.arrow_back_ios_new),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
