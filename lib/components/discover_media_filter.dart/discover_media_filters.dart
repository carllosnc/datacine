import 'package:flutter/material.dart';
import '/components/components.dart';
import './year_filter.dart';

discoverMediaFilters(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog.fullscreen(
        backgroundColor: Colors.black.withOpacity(0.3),
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).colorScheme.onSecondary,
            ),
            child: Column(
              children: [
                const ModalHeader(
                  title: "Filter",
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 10,
                  ),
                  child: const Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Year or decade'),
                          YearsFilter(),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
