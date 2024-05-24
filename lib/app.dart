import 'package:flutter/material.dart';
import 'package:practice_with_zub/main.dart';
import 'package:practice_with_zub/screens/account_screens/edit_profile_info.dart';
import 'package:practice_with_zub/screens/authorization_screens/registration_screen.dart';
import 'package:practice_with_zub/screens/details_screen/details_screen.dart';
import 'package:practice_with_zub/screens/splash_screen/splash_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) {
        if (settings.name == '/details_screen') {
          return MaterialPageRoute(
              settings: settings, builder: (context) => const DetailsScreen());
        }
        if (settings.name == '/registration_screen') {
          return MaterialPageRoute(
              settings: settings,
              builder: (context) => const RegistrationScreen());
        }
        if (settings.name == '/edit_profile_screen') {
          return MaterialPageRoute(
              settings: settings,
              builder: (context) => const EditProfileScreen());
        }
      },
      debugShowCheckedModeBanner: false,
      home: Main(),
    );
  }
}
