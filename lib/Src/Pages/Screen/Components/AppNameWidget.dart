import 'package:flutter/material.dart';
import 'package:sale_app/Src/Pages/Values/custom_color.dart';
import 'package:sale_app/Src/Pages/Values/custom_text.dart';

class AppnamWidget extends StatelessWidget {
  final Color? greenTitle;

  const AppnamWidget({
    Key? key,
    this.greenTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: AppStyles.h1.copyWith(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
        ),
        children: [
          TextSpan(
              text: 'Green',
              style: TextStyle(
                  color: greenTitle ?? Theme.of(context).primaryColor)),
          TextSpan(
              text: 'grocer',
              style: AppStyles.h1
                  .copyWith(color: Appcolor.logoColor, fontSize: 40))
        ],
      ),
    );
  }
}
