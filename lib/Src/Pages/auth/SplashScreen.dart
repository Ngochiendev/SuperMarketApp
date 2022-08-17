import 'package:flutter/material.dart';
import 'package:sale_app/Src/Pages/Screen/Components/AppNameWidget.dart';
import 'package:sale_app/Src/Pages/Values/custom_color.dart';
import 'package:sale_app/Src/Pages/auth/SigninScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      const Duration(milliseconds: 1500),
      () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
          return SignInScreen();
        }));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Customcolor.customswatchColor,
              Customcolor.customswatchColor.shade700,
            ],
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            AppnamWidget(greenTitle: Colors.white),
            SizedBox(height: 10),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
