// ignore_for_file: prefer_const_constructors

import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:add_to_cart_animation/add_to_cart_icon.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:sale_app/Src/Pages/Screen/Components/AppNameWidget.dart';
import 'package:sale_app/Src/Pages/Screen/Components/CategoryTitle.dart';
import 'package:sale_app/Src/Pages/Screen/Components/itemTitle.dart';
import 'package:sale_app/Src/Pages/Values/custom_color.dart';
import 'package:sale_app/Src/Pages/Values/custom_text.dart';
import 'package:sale_app/Src/Pages/Values/app_data.dart' as appData;
import 'package:sale_app/Src/Pages/Screen/Components/CustomShimmer.dart';
import 'package:sale_app/Src/Services/ultilServices.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategogies = 'cauliflower';
  final UltilServices ultilServices = UltilServices();

  GlobalKey<CartIconKey> globalkeyCart = GlobalKey<CartIconKey>();
  late Function(GlobalKey) runAddToCardAnimation;
  void itemSelectedAnimation(GlobalKey gkItem) async {
    await runAddToCardAnimation(gkItem);
  }

  //load product
  bool isLoadding = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        isLoadding = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appbar
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: GestureDetector(
              onTap: () {
                print('Cart');
              },
              child: Badge(
                badgeColor: Colors.red,
                shape: BadgeShape.circle,
                animationType: BadgeAnimationType.scale,
                badgeContent: Text('2',
                    style: TextStyle(color: Colors.white, fontSize: 12)),
                child: AddToCartIcon(
                  key: globalkeyCart,
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Appcolor.backgroundColor,
                  ),
                ),
              ),
            ),
          ),
        ],
        title: AppnamWidget(),
      ),
      // Container
      body: AddToCartAnimation(
        gkCart: globalkeyCart,
        dragToCardCurve: Curves.easeIn,
        dragToCardDuration: const Duration(milliseconds: 100),
        previewCurve: Curves.linearToEaseOut,
        // previewDuration: const Duration(milliseconds: 500),
        receiveCreateAddToCardAnimationMethod: (addToCardAnimationMethod) {
          runAddToCardAnimation = addToCardAnimationMethod;
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  prefixIcon: Icon(Icons.search, size: 21),
                  hintText: 'Search...',
                  hintStyle: TextStyle(color: Colors.grey.shade400),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide(width: 0, style: BorderStyle.none),
                  ),
                  isDense: true,
                ),
              ),

              // category
              SizedBox(
                  height: 40,
                  child: !isLoadding
                      ? ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_, index) {
                            return CategoryTitle(
                              onPress: () {
                                setState(() {
                                  selectedCategogies =
                                      appData.Categories[index];
                                });
                              },
                              categories: appData.Categories[index],
                              isSelected: appData.Categories[index] ==
                                  selectedCategogies,
                            );
                          },
                          separatorBuilder: (_, index) => SizedBox(width: 10),
                          itemCount: appData.Categories.length)
                      : ListView(
                          scrollDirection: Axis.horizontal,
                          children: List.generate(
                            20,
                            (index) => Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(right: 12),
                              child: CustomShimmer(
                                width: 80,
                                height: 20,
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        )),

              // Gridview
              Expanded(
                child: !isLoadding
                    ? GridView.builder(
                        physics: BouncingScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // số lượng cột
                            mainAxisSpacing: 10, // khoảng cách
                            crossAxisSpacing: 10, // khoảng cách
                            childAspectRatio: 9 / 12 // kích thước ô
                            ),
                        itemCount: appData.items.length,
                        itemBuilder: (_, index) {
                          return itemTitle(
                              item: appData.items[index],
                              cartAnimationMethod: itemSelectedAnimation);
                        },
                      )
                    : GridView.count(
                        physics: BouncingScrollPhysics(),
                        crossAxisCount: 2, // số lượng cột
                        mainAxisSpacing: 10, // khoảng cách
                        crossAxisSpacing: 10, // khoảng cách
                        childAspectRatio: 9 / 12, // kích thước ô
                        children: List.generate(
                          appData.items.length,
                          (index) => CustomShimmer(
                            height: double.infinity,
                            width: double.infinity,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
