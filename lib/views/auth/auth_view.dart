import 'package:flutter/material.dart';
import 'package:vw/vw.dart';
import '/imports/app.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  late final AppLifecycleListener appLifecycleListener;

  @override
  void initState() {
    super.initState();

    appLifecycleListener = AppLifecycleListener(
      onResume: () async {
        await AppWrite.loadProfile();

        AppWrite.isLoggedIn().then((value) {
          if (value) {
            Navigator.pop(context);
          }
        });
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    appLifecycleListener.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: VWColumn(
            gap: 70,
            padding: const EdgeInsets.all(20),
            verticalAlignment: MainAxisAlignment.center,
            horizontalAlignment: CrossAxisAlignment.center,
            children: [
              VWColumn(
                gap: 5,
                horizontalAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(
                      Assets.logoFull,
                      height: 160,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 300,
                    child: Text(
                      'Do login to create playlist, save your favorites and more',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.label,
                      ),
                    ),
                  ),
                ],
              ),
              VWColumn(
                gap: 10,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  VWButton(
                    label: "Login with Google",
                    leftIcon: FontAwesomeIcons.google,
                    color: AppColors.buttonColor,
                    onTap: () {
                      AppWrite.oAuth2(
                        context: context,
                        provider: "google",
                      );
                    },
                    horizontalAlignment: MainAxisAlignment.start,
                  ),
                  VWButton(
                    label: "Login with Github",
                    leftIcon: FontAwesomeIcons.github,
                    color: AppColors.buttonColor,
                    onTap: () {
                      AppWrite.oAuth2(
                        context: context,
                        provider: "github",
                      );
                    },
                    horizontalAlignment: MainAxisAlignment.start,
                  ),
                  VWButton(
                    label: "Login with Facebook",
                    leftIcon: FontAwesomeIcons.facebook,
                    color: AppColors.buttonColor,
                    onTap: () {
                      AppWrite.oAuth2(
                        context: context,
                        provider: "facebook",
                      );
                    },
                    horizontalAlignment: MainAxisAlignment.start,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
