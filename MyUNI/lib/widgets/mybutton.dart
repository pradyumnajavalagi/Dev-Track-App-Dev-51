import 'package:MyUni/utils/colors.dart';
import 'package:flutter/material.dart';
class MyButton extends StatelessWidget {
  final void Function()? onTap;
  final Widget child;
  const MyButton({Key? key, this.onTap, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.circular(15)
        ),
        padding: EdgeInsets.all(25),
        child:child,
      ),
    );
  }
}