import 'package:flutter/material.dart';
import 'package:sale_app/Src/Pages/Values/custom_text.dart';

class CategoryTitle extends StatefulWidget {
  const CategoryTitle({
    Key? key,
    required this.isSelected,
    required this.categories,
    required this.onPress,
  }) : super(key: key);
  final String categories;
  final bool isSelected;
  final VoidCallback onPress;

  @override
  State<CategoryTitle> createState() => _CategoryTitleState();
}

class _CategoryTitleState extends State<CategoryTitle> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: widget.onPress,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: widget.isSelected ? Colors.green : Colors.white,
          ),
          child: Text(
            widget.categories,
            style: AppStyles.h1.copyWith(
                fontSize: widget.isSelected ? 16 : 14,
                color: widget.isSelected ? Colors.white : Colors.red),
          ),
        ),
      ),
    );
  }
}
