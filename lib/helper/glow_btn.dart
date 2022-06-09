import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';

class Glow_btn extends StatelessWidget {
  const Glow_btn({
    Key? key,
    required this.press,
    required this.text,
  }) : super(key: key);

  final VoidCallback press;
  final String text;

  @override
  Widget build(BuildContext context) {
  return GlowButton(
                onPressed: press,
                color: Colors.white,
                child: Text(text),
              );
}
}