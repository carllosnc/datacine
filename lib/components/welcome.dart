import 'package:flutter/material.dart';
import '/core/core.dart';

class Welcome extends StatelessWidget {
  final Function onPressed;

  const Welcome({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Container(
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.only(bottom: 80),
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/welcome.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              Assets.extendedLogo,
              height: 40,
            ),
            const SizedBox(height: 30),
            Text(
              '"What a lovely day"',
              style: TextStyle(
                fontSize: 28,
                color: Theme.of(context).colorScheme.primary,
                fontStyle: FontStyle.italic,
                shadows: const [
                  Shadow(
                    color: Colors.black,
                    blurRadius: 10,
                    offset: Offset(5, 5),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        child: FilledButton(
          onPressed: () {
            SharedPrefs().prefs.setBool('welcome', false);
            onPressed();
          },
          child: const Text('Let\'s go!'),
        ),
      ),
    );
  }
}
