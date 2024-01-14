import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vw/vw.dart';
import '/imports/app.dart';
import './new_category.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  bool logoutLoading = false;
  late String name;

  logoutAction(BuildContext context) async {
    if (authNotifier.isSignedIn.value) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('Logout'),
            ),
          ],
        ),
      ).then((value) async {
        if (value == true) {
          setState(() {
            logoutLoading = true;
          });
          await AppWrite.logout();
          authNotifier.setSignedIn(false);

          if (context.mounted) {
            setState(() {
              logoutLoading = false;
            });
            context.go('/');
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppWrite.profile?.name ?? 'Profile'),
        actions: [
          if (logoutLoading)
            const Center(
              child: Padding(
                padding: EdgeInsets.only(right: 16.0),
                child: SizedBox(
                  height: 18,
                  width: 18,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                ),
              ),
            ),
          if (!logoutLoading)
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () => logoutAction(context),
            ),
        ],
      ),
      body: const Center(
        child: Text('Profile'),
      ),
      bottomNavigationBar: VWRow(
        horizontalAlignment: MainAxisAlignment.center,
        padding: const EdgeInsets.all(20),
        children: [
          VWButton(
            color: AppColors.buttonColor,
            leftIcon: Icons.add,
            label: "New Category",
            onTap: () {
              createNewCategory(context);
            },
          ),
        ],
      ),
    );
  }
}
