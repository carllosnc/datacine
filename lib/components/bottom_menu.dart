import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:datacine/core/constants/colors.dart';

class BottomItem extends StatelessWidget {
  final String label;
  final void Function()? onTap;
  final IconData? icon;

  const BottomItem({
    super.key,
    required this.label,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
      ),
      child: Material(
        color: Theme.of(context).colorScheme.secondaryContainer,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
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
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      height: 1.2,
                      color: ProjectColors(context).text,
                      fontSize: 14,
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
      height: 65,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background.withOpacity(0.7),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          separatorBuilder: (context, index) => const SizedBox(width: 10),
          itemBuilder: (context, index) => items[index],
        ),
      ),
    );
  }
}
