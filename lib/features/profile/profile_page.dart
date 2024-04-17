import 'package:financas/locator.dart';
import 'package:financas/services/auth_service.dart';
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
            const Text("Perfil"),
            ElevatedButton(
                onPressed: () async {
                  await locator.get<AuthService>().signOut();
                  await _secureStorage.deleteAll();
                  if (mounted) {
                    // ignore: use_build_context_synchronously
                    Navigator.popUntil(context, ModalRoute.withName('/'));
                  }
                },
                child: const Text("Logout"))
          ],
        ),
      ),
    );
  }
}
