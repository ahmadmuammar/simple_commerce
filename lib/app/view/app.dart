import 'package:flutter/material.dart';
import 'package:simple_commerce/core/core.dart';
import 'package:simple_commerce/features/authentication/presentation/presentation.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.lightTheme,
      home: const LoginPage(),
    );
  }
}
