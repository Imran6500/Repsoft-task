import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:task/screens/auth_screens/SignIn_screen.dart';
import 'package:task/screens/auth_screens/SignUp_screen.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff1F7F8B)),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: const SignUpScreen());
  }
}
