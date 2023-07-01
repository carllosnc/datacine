import 'package:flutter/material.dart';

class TVShowsTab extends StatefulWidget {
  const TVShowsTab({
    super.key,
  });

  @override
  State<TVShowsTab> createState() => _TVShowsTabState();
}

class _TVShowsTabState extends State<TVShowsTab> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        children: [
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
