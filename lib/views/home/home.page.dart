import 'package:ds1/ds1.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const DS1Text(
          'Flutter starter',
          fontSize: 18,
        ),
      ),
      body: const Center(
        child: Text('🍎', style: TextStyle(fontSize: 50)),
      ),
    );
  }
}
