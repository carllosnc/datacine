import 'package:ds1/ds1.dart';
import 'package:flutter/material.dart';
import '/core/core.dart';

class BottomItem extends StatelessWidget {
  final String label;
  final void Function()? onTap;

  const BottomItem({
    super.key,
    required this.label,
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
            padding: const EdgeInsets.all(10),
            child: Center(
              child: DS1Text(
                label,
                fontSize: 13,
                bold: true,
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
      height: 45,
      decoration: const BoxDecoration(
        color: ProjectColors.bottomBarBackground,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
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
