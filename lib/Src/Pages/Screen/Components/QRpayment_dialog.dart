import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:sale_app/Src/Models/order_models.dart';
import 'package:sale_app/Src/Pages/Values/custom_text.dart';
import 'package:sale_app/Src/Services/ultilServices.dart';

class QRPaymentDialog extends StatelessWidget {
  QRPaymentDialog({
    Key? key,
    required this.order,
  }) : super(key: key);

  final OrderModel order;
  final UltilServices ultilServices = UltilServices();

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Stack(
          children: [
            // icon close
            Padding(
              padding: const EdgeInsets.fromLTRB(266, 10, 0, 0),
              child: GestureDetector(
                child: const Icon(
                  Icons.close,
                  size: 22,
                ),
                onTap: () {
                  print('close QR');
                  Navigator.pop(context);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //title
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text('Thanh toán bằng mã QR',
                        style: AppStyles.h1
                            .copyWith(color: Colors.black, fontSize: 18)),
                  ),

                  // QR CODE
                  QrImage(
                    data: "ddb8263828!!9hiencute",
                    version: QrVersions.auto,
                    size: 220,
                  ),
                  //die day
                  Text(
                    'Ngày hết hạn: ${ultilServices.formatDateTime(order.overdie_DateTime)} ',
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  //total
                  Text('Total: ${ultilServices.priceToCurrency(order.total)}',
                      style: AppStyles.h1.copyWith(color: Colors.black)),
                  //button coppy QR
                  OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          side:
                              const BorderSide(width: 1, color: Colors.green)),
                      onPressed: () {
                        print('coppy QR');
                      },
                      icon: const Icon(
                        Icons.content_copy_outlined,
                        size: 15,
                      ),
                      label: const Text('Coppy QR code')),
                ],
              ),
            ),
          ],
        ));
  }
}
