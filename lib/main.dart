import 'package:flutter/material.dart';
import 'package:flutter_firs_project/config/routes/app_router.dart';
import 'package:flutter_firs_project/features/auth/view/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFF3C5057),
      ),
      home: const Login(),
      onGenerateRoute: AppRouter.onGenerateRoutes,
    );
  }
}
