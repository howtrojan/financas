import 'package:financas/common/constants/routes.dart';
import 'package:financas/services/secure_storage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomePage> {
  final _secureStorage = const SecureStorageService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Home Page"),
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
