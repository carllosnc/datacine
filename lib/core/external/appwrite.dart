import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import '/imports/app.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppWrite {
  static User? profile;

  static Client getClient() {
    Client client = Client();
    client
      ..setEndpoint('https://cloud.appwrite.io/v1')
      ..setProject(dotenv.env['APPWRITE_ID']);

    return client;
  }

  static void oAuth2({
    required BuildContext context,
    required String provider,
  }) async {
    try {
      final account = Account(getClient());

      await account.createOAuth2Session(
        provider: provider.toString(),
      );

      authNotifier.setSignedIn(true);
    } on Exception {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Error signing in with Google'),
          ),
        );
      }
    }
  }

  static Future<bool> isLoggedIn() async {
    final account = Account(getClient());

    try {
      await account.get();
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> logout() async {
    final account = Account(getClient());
    await account.deleteSession(sessionId: 'current');

    return true;
  }

  static Future<void> createAccount({
    required String email,
    required String password,
    required String name,
    required Function(String) onError,
    required Function onSuccess,
  }) async {
    final account = Account(getClient());

    var user = account.create(
      userId: ID.unique(),
      email: email,
      password: password,
      name: name,
    );

    user.then((value) {
      authNotifier.setSignedIn(true);
      onSuccess();
    }).catchError((e) {
      onError(e.message);
    });
  }

  static Future<void> loadProfile() async {
    final account = Account(getClient());
    var user = account.get();

    user.then((User value) {
      profile = value;
    }).catchError((e) {
      profile = null;
    });
  }

  static dynamic getDatabase() async {
    final Client client = getClient();
    final databases = Databases(client);

    return databases;
  }

  static Future<void> createCategory({
    required String name,
    required String description,
    required Function(String) onError,
    required Function onSuccess,
  }) async {
    final database = await getDatabase();

    var category = database.createDocument(
      collectionId: 'categories',
      data: {
        'name': name,
        'description': description,
      },
      read: ['*'],
      write: ['*'],
    );

    category.then((value) {
      onSuccess();
    }).catchError((e) {
      onError(e.message);
    });
  }
}
