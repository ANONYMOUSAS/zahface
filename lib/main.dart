import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zahface/providers/auth_providers.dart';
import 'package:zahface/screens/auth/login.dart';
import 'package:zahface/theme/fonts.dart';

import 'theme/theme.dart';
import 'theme/theme_provider.dart';

void main() {
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthProviders()),
          ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ],
        child:  MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeNotifier, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Zahface',
          theme: themeNotifier.themeData,
          home: Login(),
        );
      }
    );
  }
}

