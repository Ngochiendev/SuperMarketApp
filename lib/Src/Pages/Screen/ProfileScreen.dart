import 'package:flutter/material.dart';
import 'package:sale_app/Src/Pages/Values/custom_text.dart';
import 'package:sale_app/Src/Pages/auth/Components/custom_text_field.dart';
import 'package:sale_app/Src/Pages/Values/app_data.dart' as appdata;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        elevation: 0,
        title: const Text('Profile'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {
                print('logout');
              },
              child: const Icon(Icons.logout),
            ),
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
        children: [
          //email
          CustomTextField(
            readOnly: true,
            initvalue: appdata.user.email,
            icon: Icons.email,
            label: 'Email',
            hintText: '',
          ),
          const SizedBox(height: 15),
          //Name
          CustomTextField(
            readOnly: true,
            initvalue: appdata.user.name,
            icon: Icons.person,
            label: 'Name',
            hintText: '',
          ),
          const SizedBox(height: 15),
          //Phone
          CustomTextField(
            readOnly: true,
            initvalue: appdata.user.phone,
            icon: Icons.phone,
            label: 'Phone',
            hintText: '',
          ),
          const SizedBox(height: 15),
          //CPF
          CustomTextField(
            readOnly: true,
            initvalue: appdata.user.CPF,
            icon: Icons.file_copy,
            label: 'CPF',
            hintText: '',
            isSecret: true,
          ),
          const SizedBox(height: 40),
          SizedBox(
            height: 50,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.green),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Text('Cập Nhật Mật Khẩu'),
              onPressed: () {
                updatapassword();
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<bool?> updatapassword() {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: Text(
                        'Change Password',
                        textAlign: TextAlign.center,
                        style: AppStyles.h1.copyWith(color: Colors.green),
                      ),
                    ),
                    // Text(
                    //   'Current password',
                    //   style: AppStyles.h2.copyWith(color: Colors.black),
                    // ),
                    // SizedBox(height: 5),

                    // Current password
                    const CustomTextField(
                      isSecret: true,
                      icon: Icons.lock,
                      label: 'Enter current password',
                      hintText: '',
                    ),
                    const SizedBox(height: 15),
                    // Text(
                    //   'New Password',
                    //   style: AppStyles.h2.copyWith(color: Colors.black),
                    // ),
                    // SizedBox(height: 5),

                    // New password
                    const CustomTextField(
                      isSecret: true,
                      icon: Icons.lock_outline,
                      label: 'Enter new password',
                      hintText: '',
                    ),
                    const SizedBox(height: 15),
                    // Text(
                    //   'Confirm New Password',
                    //   style: AppStyles.h2.copyWith(color: Colors.black),
                    // ),
                    // SizedBox(height: 5),

                    //Confirm password
                    const CustomTextField(
                      isSecret: true,
                      icon: Icons.lock_outline,
                      label: 'Confirm new password',
                      hintText: '',
                    ),
                    const SizedBox(height: 20),

                    //Enter

                    SizedBox(
                      height: 40,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text('Xác Nhận'),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 15,
                right: 10,
                child: GestureDetector(
                  onTap: () {
                    print('close');
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.close),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
