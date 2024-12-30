import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Pages/Favorite/Provider/Favorite_Provider.dart';
import 'Pages/Splash/OnBorading_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FavoriteProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: OnboardingPage(),
      ),
    );
  }
}
