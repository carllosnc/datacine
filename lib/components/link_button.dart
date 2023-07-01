import 'package:flutter/material.dart';

class LinkButton extends StatelessWidget {
  final void Function()? onPressed;
  final String label;

  const LinkButton({
    super.key,
    required this.onPressed,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: TextButton(
        style: TextButton.styleFrom(
          textStyle: const TextStyle(
            fontSize: 13,
          ),
          backgroundColor: Colors.white.withOpacity(0.05),
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 0,
          ),
        ),
        onPressed: onPressed,
        child: Text(label),
      ),
    );
  }
}
