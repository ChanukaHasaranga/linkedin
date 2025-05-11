import 'package:flutter/material.dart';
import 'package:linkedin/view/landingpage.dart';
import 'package:linkedin/viewmodel/auth_view_model.dart';
import 'package:linkedin/viewmodel/profile_view_model.dart';
import 'package:linkedin/viewmodel/users_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
         providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => ProfileViewModel()),
        ChangeNotifierProvider(create: (_) => UsersViewModel()),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
         title: 'LinkedIn Clone',
          theme: ThemeData(primarySwatch: Colors.blue),
        home: const Landingpage(),
      ),
    );
  }
}
