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
        borderRadius: BorderRadius.all(Radius.circular(14)),
      ),
      child: Material(
        color: Theme.of(context).colorScheme.secondary.withOpacity(0.08),
        child: InkWell(
          onTap: onTap,
          splashColor: Theme.of(context).colorScheme.secondaryContainer,
          child: Center(
            child: Wrap(
              direction: Axis.vertical,
              spacing: 6,
              crossAxisAlignment: WrapCrossAlignment.center,
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
  final List<GridMenuItem> items;

  const GridMenu({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 2.2,
      ),
      children: items,
    );
  }
}
