import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vw/vw.dart';
import '/imports.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Container(
        padding: const EdgeInsets.only(bottom: 130),
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/welcome.webp'),
            fit: BoxFit.cover,
          ),
        ),
        child: VWColumn(
          gap: 15,
          verticalAlignment: MainAxisAlignment.end,
          horizontalAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              Assets.extendedLogo,
              height: 30,
            ),
            const Text(
              "First rule: you do not talk about Datacine.",
              style: TextStyle(
                fontSize: 16,
                shadows: [
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
      bottomNavigationBar: VWRow(
        horizontalAlignment: MainAxisAlignment.center,
        padding: const EdgeInsets.fromLTRB(50, 0, 50, 40),
        children: [
          VWButton(
            onTap: () {
              sharedPreferences.prefs.setBool('welcome', false);
              context.go('/home');
            },
            label: 'Let\'s go!',
          ),
        ],
      ),
    );
  }
}
