// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sale_app/Src/Models/cart_item_models.dart';
import 'package:sale_app/Src/Models/order_models.dart';
import 'package:sale_app/Src/Pages/Screen/Components/Order_status.dart';
import 'package:sale_app/Src/Pages/Screen/Components/QRpayment_dialog.dart';
import 'package:sale_app/Src/Pages/Values/app_data.dart';
import 'package:sale_app/Src/Pages/Values/custom_text.dart';
import 'package:sale_app/Src/Services/ultilServices.dart';

class OrderTitle extends StatefulWidget {
  final OrderModel oder;
  final UltilServices ultilServices = UltilServices();
  OrderTitle({
    Key? key,
    required this.oder,
  }) : super(key: key);

  @override
  State<OrderTitle> createState() => _OrderTitleState();
}

class _OrderTitleState extends State<OrderTitle> {
  @override
  Widget build(BuildContext context) {
    return Card(
      // elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          //tự động mở khi ở trạng thái pending payment
          initiallyExpanded: widget.oder.status == 'pending payment',
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Đơn Hàng: ${widget.oder.id}'),
              Text(
                  'Thời gian ${widget.ultilServices.formatDateTime(widget.oder.create_DateTime)}'),
              // Text(
              //     'Kết thúc ${widget.ultilServices.formatDateTime(widget.oder.overdie_DateTime)}'),
            ],
          ),
          childrenPadding: EdgeInsets.fromLTRB(16, 0, 16, 16),
          expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            IntrinsicHeight(
              child: Row(
                children: [
                  //List item
                  Expanded(
                    flex: 3,
                    child: SizedBox(
                      height: 150,
                      child: ListView(
                        children: widget.oder.item.map((orderItem) {
                          return _OderItemWidget(
                            orderItem: orderItem,
                          );
                        }).toList(),
                      ),
                    ),
                  ),

                  VerticalDivider(
                    color: Colors.grey.shade400,
                    thickness: 1,
                  ),

                  //Status Order
                  Expanded(
                    flex: 2,
                    child: OrderStatus(
                      status: widget.oder.status,
                      isOverdie:
                          widget.oder.overdie_DateTime.isBefore(DateTime.now()),
                    ),
                  ),
                ],
              ),
            ),
            //total
            Text.rich(
              TextSpan(
                style: TextStyle(fontSize: 17),
                children: [
                  TextSpan(
                    text: 'Total ',
                    style: AppStyles.h1.copyWith(color: Colors.black),
                  ),
                  TextSpan(
                    text:
                        widget.ultilServices.priceToCurrency(widget.oder.total),
                  ),
                ],
              ),
            ),

            //QR CODE
            Visibility(
              //tự động mở khi ở trạng thái pending payment,
              visible: widget.oder.status == 'pending payment',
              child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (_) {
                          return QRPaymentDialog(
                            order: widget.oder,
                          );
                        });
                    print('mã QR');
                  },
                  icon: Icon(
                    Icons.qr_code_scanner,
                    size: 25,
                  ),
                  label: Text('Mã QR code')),
            )
          ],
        ),
      ),
    );
  }
}

class _OderItemWidget extends StatelessWidget {
  _OderItemWidget({
    Key? key,
    required this.orderItem,
  }) : super(key: key);

  final UltilServices ultilServices = UltilServices();
  final CartItemModels orderItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 5,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              '${orderItem.quantity} ${orderItem.item.unit} ${orderItem.item.itemName}',
              style: AppStyles.h2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            ultilServices.priceToCurrency(orderItem.item.price),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
