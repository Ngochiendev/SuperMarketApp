// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:sale_app/Src/Pages/Values/custom_color.dart';
import 'package:sale_app/Src/Pages/Values/custom_text.dart';
import 'package:sale_app/Src/Pages/auth/Components/custom_text_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_new
    var PhoneFormatter = new MaskTextInputFormatter(
        mask: '####-###-###', filter: {"#": RegExp(r'[0-9]')});
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        backgroundColor: Appcolor.backgroundColor,
      ),
      backgroundColor: Appcolor.backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          height: size.height - 90,
          width: size.width,
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    'REGISTER NOW',
                    style: AppStyles.h1.copyWith(fontSize: 35),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 40),
                height: 480,
                width: size.width,
                decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(45)),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomTextField(
                        icon: Icons.email, label: 'email', hintText: ''),
                    SizedBox(height: 15),
                    CustomTextField(
                      icon: Icons.lock,
                      label: 'Password',
                      hintText: '',
                      isSecret: true,
                    ),
                    SizedBox(height: 15),
                    CustomTextField(
                        icon: Icons.person, label: 'Name', hintText: ''),
                    SizedBox(height: 15),
                    CustomTextField(
                        icon: Icons.phone,
                        label: 'Phone',
                        hintText: '+84',
                        inputFormatter: [PhoneFormatter]),
                    SizedBox(height: 15),
                    CustomTextField(
                        icon: Icons.file_copy, label: 'CPF', hintText: ''),
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16))),
                          child: Text(
                            'Register',
                            style: AppStyles.h1,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
