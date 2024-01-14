import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginOrProfile extends StatelessWidget {
  final bool isLoggedIn;

  const LoginOrProfile({
    Key? key,
    required this.isLoggedIn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isLoggedIn) {
      return GestureDetector(
        onTap: () {
          context.go('/profile');
        },
        child: const SizedBox(
          width: 40,
          height: 40,
          child: Center(
            child: Text(
              "🍔",
              style: TextStyle(
                fontSize: 26,
              ),
            ),
          ),
        ),
      );
    }

    return IconButton(
      onPressed: () {
        context.go('/auth');
      },
      icon: const Icon(Icons.person_2_outlined),
    );
  }
}
