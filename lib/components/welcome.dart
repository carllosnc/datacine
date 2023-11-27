import 'package:flutter/material.dart';
import 'package:vw/vw.dart';
import '/imports/app.dart';

class Welcome extends StatelessWidget {
  final Function onPressed;

  const Welcome({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/welcome.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: VWColumn(
          gap: 10,
          verticalAlignment: MainAxisAlignment.end,
          horizontalAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              Assets.extendedLogo,
              height: 35,
            ),
            Text(
              '"What a lovely day"',
              style: TextStyle(
                fontSize: 23,
                color: Theme.of(context).colorScheme.primary,
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
      bottomNavigationBar: VWRow(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          VWButton(
            fullWidth: true,
            onTap: () {
              SharedPrefs().prefs.setBool('welcome', false);
              onPressed();
            },
            label: 'Let\'s go!',
          ),
        ],
      ),
    );
  }
}
