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
        child: VWColumn(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
          verticalAlignment: MainAxisAlignment.end,
          children: [
            VWColumn(
              horizontalAlignment: CrossAxisAlignment.center,
              gap: 20,
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
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        child: VWButton(
          onTap: () {
            SharedPrefs().prefs.setBool('welcome', false);
            onPressed();
          },
          label: 'Get Started',
        ),
      ),
    );
  }
}
