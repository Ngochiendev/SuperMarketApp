import 'package:flutter/material.dart';
import 'package:sale_app/Src/Pages/Screen/Components/Order_title.dart';
import 'package:sale_app/Src/Pages/Values/custom_text.dart';
import 'package:sale_app/Src/Pages/Values/app_data.dart' as appData;

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 35,
          elevation: 0,
          title:
              Text('Orders', style: AppStyles.h2.copyWith(color: Colors.black)),
          backgroundColor: Colors.white,
        ),
        body: ListView.builder(
          itemBuilder: (_, int index) {
            return OrderTitle(oder: appData.order[index]);
          },
          itemCount: appData.order.length,
          padding: const EdgeInsets.all(16),
        ));
  }
}
