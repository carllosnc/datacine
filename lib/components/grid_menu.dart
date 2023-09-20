import 'package:datacine/core/constants/colors.dart';
import 'package:flutter/material.dart';

class GridMenuItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final void Function()? onTap;

  const GridMenuItem({
    super.key,
    required this.label,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(100)),
      ),
      child: Material(
        color: ProjectColors(context).linkButton,
        child: InkWell(
          onTap: onTap,
          splashColor: Theme.of(context).colorScheme.secondaryContainer,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Wrap(
              direction: Axis.horizontal,
              runAlignment: WrapAlignment.center,
              spacing: 20,
              crossAxisAlignment: WrapCrossAlignment.start,
              children: [
                Icon(
                  icon,
                  size: 18,
                  color: Theme.of(context).colorScheme.primary,
                ),
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GridMenu extends StatelessWidget {
  final List<Widget> items;

  const GridMenu({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        childAspectRatio: 8,
      ),
      children: items,
    );
  }
}
