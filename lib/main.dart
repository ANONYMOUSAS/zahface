import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zahface/providers/auth_providers.dart';
import 'package:zahface/providers/post_providers.dart';
import 'package:zahface/screens/auth/login.dart';

import 'providers/like_providers.dart';
import 'screens/auth/register.dart';
import 'screens/bottom_navigation.dart';
import 'screens/home.dart';
import 'screens/splashscreen.dart';
import 'theme/theme_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthProviders()),
          ChangeNotifierProvider(create: (_) => ThemeProvider()),
          ChangeNotifierProvider(create: (_) => PostProvider()),
          ChangeNotifierProvider(create: (_) => LikeProvider()),
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
          // home: Login(),
          initialRoute: '/',
          routes: {
            '/': (context) => SplashScreen(),
            '/login': (context) => Login(),
            '/bottomNavBar': (context) => BottomNavBar(),
            '/home': (context) => HomeScreen(),
            '/register': (context) => Register(),
          },
        );
      }
    );
  }
}

