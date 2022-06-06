import 'package:flutter/material.dart';

class Card_Icons extends StatelessWidget {
  final IconData icon;
  final double size;
  final Color color;
  const Card_Icons({Key? key, required this.icon, required this.size, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
                    onPressed: () {
  
                    },
                    icon: Icon(icon,
                        size: size, color:color));
  }
}