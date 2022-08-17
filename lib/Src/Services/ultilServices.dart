import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class UltilServices {
  String priceToCurrency(double price) {
    NumberFormat numberFormat = NumberFormat.currency(
      locale: 'vi',
      customPattern: ',### \u00a4',
      // decimalDigits: 3,
    );
    return numberFormat.format(price);
  }

  String formatDateTime(DateTime dateTime) {
    initializeDateFormatting();
    DateFormat dateFormat = DateFormat.yMd('vi').add_Hms();
    return dateFormat.format(dateTime);
  }

  void ShowToast({required String message, bool isError = false}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor:
            isError ? const Color.fromARGB(255, 245, 103, 93) : Colors.white,
        textColor: isError ? Colors.white : Colors.black,
        fontSize: 14.0);
  }
}
