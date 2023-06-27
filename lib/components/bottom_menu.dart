import 'package:ds1/ds1.dart';
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
                  DS1Text(
                    label,
                    fontColor: ProjectColors(context).text,
                    fontSize: 13,
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
        //rounded
        borderRadius: const BorderRadius.only(
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
