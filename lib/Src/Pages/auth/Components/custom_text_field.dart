import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final IconData icon;
  final String label;
  final String hintText;
  final bool isSecret;
  final List<TextInputFormatter>? inputFormatter;
  final String? initvalue;
  final bool readOnly;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  const CustomTextField({
    Key? key,
    required this.icon,
    required this.label,
    required this.hintText,
    this.isSecret = false,
    this.inputFormatter,
    this.initvalue,
    this.readOnly = false,
    this.validator,
    this.controller,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscure = false;
  @override
  void initState() {
    isObscure = widget.isSecret;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      readOnly: widget.readOnly,
      initialValue: widget.initvalue,
      inputFormatters: widget.inputFormatter,
      obscureText: isObscure,
      validator: widget.validator,
      decoration: InputDecoration(
        prefixIcon: Icon(widget.icon),
        suffixIcon: widget.isSecret
            ? IconButton(
                icon: Icon(isObscure ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
              )
            : null, //hiện icon hiển thị pass ở mục password
        labelText: widget.label,
        hintText: widget.hintText,
        isDense: true, //tự đông giãn trong button
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
      ),
    );
  }
}
