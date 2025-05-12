import 'package:flutter/material.dart';
import 'package:linkedin/model/user_model.dart';
import 'package:linkedin/view/Mainpage.dart';

class AuthViewModel extends ChangeNotifier {
  UserModel? _user;
  final Map<String, String> _dummyUsers = {};

  UserModel? get user => _user;

  void login(String email, String password, BuildContext context) {
    if (_dummyUsers.containsKey(email) && _dummyUsers[email] == password) {
      _user = UserModel(
          email: email,
          password: password,
          name: email.split('@')[0],
          headline: 'Freelance IOS Developer | UIKit | SwiftUI |',
          location: 'Colombo, Srilanka',
          work: "Lean transition solutions - lts",
                    languages: "Talks about #swiftui, and#iosdevelopment",

          followers: 4413,
          connection: 500);
      notifyListeners();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const Mainpage()));
    } else {
          showTopSnackBar(context, 'Invalid email or password');

    }
  }

  void signup(String email, String password, BuildContext context) {
    if (_dummyUsers.containsKey(email)) {
                showTopSnackBar(context, 'Email already registered');

    } else if (email.isNotEmpty && password.length >= 6) {
      _dummyUsers[email] = password;
      _user = UserModel(
          email: email,
          password: password,
          name: email.split('@')[0],
          headline: 'Freelance IOS Developer | UIKit | SwiftUI |',
          location: 'Colombo, Srilanka',
          languages: "Talks about #swiftui, and#iosdevelopment",
          work: "Lean transition solutions - lts",
          followers: 4413,
          connection: 500);
      notifyListeners();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const Mainpage()));
    } else {
          showTopSnackBar(context, 'Invalid email or password');

      
    }
  }
  
}
void showTopSnackBar(BuildContext context, String message) {
  final overlay = Overlay.of(context);
  late OverlayEntry overlayEntry; 

  overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      top: MediaQuery.of(context).padding.top + kToolbarHeight + 10,
      left: 16,
      right: 16,
      child: Dismissible(
        key: UniqueKey(),
        direction: DismissDirection.up,
        onDismissed: (_) => overlayEntry.remove(),
        child: Material(
          elevation: 8,
          borderRadius: BorderRadius.circular(10),
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
            decoration: BoxDecoration(
             
             
             
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              message,
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ),
      ),
    ),
  );

  overlay.insert(overlayEntry);

  // Auto-remove after 3 seconds
  Future.delayed(const Duration(seconds: 3), () {
    if (overlayEntry.mounted) overlayEntry.remove();
  });
}
