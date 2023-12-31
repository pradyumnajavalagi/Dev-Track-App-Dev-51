import 'package:MyUni/utils/colors.dart';
import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  final String text;
  final IconData icon;
  final void Function()? onTap;

  const MyListTile({Key? key, required this.text, required this.icon, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: ListTile(
        leading: Icon(
          icon,
          color: tddarkblue,
        ),
        title: Text(text,style: TextStyle(color: secondaryColor),),
        onTap:onTap,
      ),
    );
  }
}