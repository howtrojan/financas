import 'package:financas/common/constants/routes.dart';
import 'package:financas/services/secure_storage.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _secureStorage = const SecureStorageService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Profile"),
            ElevatedButton(
                onPressed: () {
                  _secureStorage.deleteOne(key: "CURRENT_USER").then((_) =>
                      Navigator.popAndPushNamed(context, NamedRoute.initial));
                },
                child: const Text("Logout"))
          ],
        ),
      ),
    );
  }
}
