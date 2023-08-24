import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CusTextField extends StatefulWidget {
  final String hint;
  final TextEditingController controller;
  final Color color;
  final Color textColor;
  final Function(String)? onChanged;
  const CusTextField(
      {Key? key,
        required this.hint,
        required this.controller,
        required this.color,
        required this.textColor,
        this.onChanged})
      : super(key: key);

  @override
  State<CusTextField> createState() => _CusTextFieldState();
}

class _CusTextFieldState extends State<CusTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      onChanged: widget.onChanged,
      onTapOutside: (b) {
        FocusScope.of(Get.context!).unfocus();
      },
      style: TextStyle(color: widget.textColor),
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(color: widget.color),
              borderRadius: BorderRadius.circular(10)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: widget.color),
              borderRadius: BorderRadius.circular(10)),
          hintText: widget.hint,
          hintStyle: context.textTheme.bodySmall?.copyWith(color: widget.color)),
    );
  }
}
