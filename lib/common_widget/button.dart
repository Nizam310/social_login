import 'package:flutter/material.dart';

class CusButton extends StatefulWidget {
  final Function() onTap;
  final String text;
  const CusButton({Key? key, required this.onTap, required this.text}) : super(key: key);

  @override
  State<CusButton> createState() => _CusButtonState();
}

class _CusButtonState extends State<CusButton> {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        height: 50,
        // margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        decoration: BoxDecoration(
            color: const Color(0xFF7067DC),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xFF7067DC))),
        child:  Center(
            child: Text(
              widget.text,
              style: const TextStyle(color: Colors.white),
            )),
      ),
    );
  }
}
