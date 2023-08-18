import 'package:flutter/material.dart';
import '/imports/app.dart';

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
          backgroundColor: ProjectColors(context).linkButton,
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 0,
          ),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          maxLines: 1,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontFamily: 'SFProDisplay',
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
