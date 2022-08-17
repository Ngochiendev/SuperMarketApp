// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sale_app/Src/Models/cart_item_models.dart';

class OrderModel {
  String id;
  DateTime create_DateTime;
  DateTime overdie_DateTime;
  List<CartItemModels> item;
  String status;
  String CopyandPaste;
  double total;
  OrderModel({
    required this.id,
    required this.create_DateTime,
    required this.overdie_DateTime,
    required this.item,
    required this.status,
    required this.CopyandPaste,
    required this.total,
  });
}
