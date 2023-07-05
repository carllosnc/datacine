import 'package:flutter/material.dart';
import 'package:giganoid_app/core/constants/colors.dart';

class BottomItem extends StatelessWidget {
  final String label;
  final void Function()? onTap;
  final IconData icon;

  const BottomItem({
    super.key,
    required this.label,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 10),
            child: Center(
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 5,
                children: [
                  Icon(
                    icon,
                    size: 15,
                    color: ProjectColors(context).text,
                  ),
                  Text(
                    label,
                    style: TextStyle(
                      color: ProjectColors(context).text,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BottomMenu extends StatelessWidget {
  final List<BottomItem> items;

  const BottomMenu({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      height: 50,
      decoration: BoxDecoration(
        color: ProjectColors(context).bottomBarBackground,
      ),
      padding: const EdgeInsets.only(top: 0, bottom: 0, left: 0, right: 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: items,
      ),
    );
  }
}
